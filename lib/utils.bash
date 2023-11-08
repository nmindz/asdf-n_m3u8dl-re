#!/usr/bin/env bash

set -euo pipefail

# TODO: Improve handling unsupported OS releases with friendlier messages.
case "$OSTYPE" in
	solaris*) export RELEASE_OS="unsupported" ;;
	darwin*)  export RELEASE_OS="osx" ;; 
	linux*)   export RELEASE_OS="linux" ;;
	bsd*)     export RELEASE_OS="unsupported" ;;
	msys*)    export RELEASE_OS="unsupported" ;;
	*)        export RELEASE_OS="unsupported" ;;
esac

# TODO: Improve handling unsupported Archs with better output/user-friendly messages.
export OS_ARCH=$(uname -m || "UNSUPPORTED")
if [ "$OS_ARCH" = "arm64" ] \
    || [ "$OS_ARCH" = "aarch64_be" ] \
    || [ "$OS_ARCH" = "aarch64" ] \
    || [ "$OS_ARCH" = "armv8b" ] \
    || [ "$OS_ARCH" = "armv8l" ]; then
    RELEASE_ARCH="arm64"
else 
    RELEASE_ARCH="x64"
fi

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for N_m3u8DL-RE.
GH_REPO="https://github.com/nilaoda/N_m3u8DL-RE"
TOOL_NAME="N_m3u8DL-RE"
TOOL_TEST="N_m3u8DL-RE --help"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)
curl_opts=("${curl_opts[@]}" -H "Accept: application/vnd.github+json")

# NOTE: You might want to remove this if N_m3u8DL-RE is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	# TODO: Adapt this. By default we simply list the tag names from GitHub releases.
	# Change this function if N_m3u8DL-RE has other means of determining installable versions.
	list_github_tags
}

get_release_id() {
	local tag
	owner=$(echo "$GH_REPO" | cut -d'/' -f4)
	repo=$(echo "$GH_REPO" | cut -d'/' -f5)
	url="https://api.github.com/repos/$owner/$repo/releases"
	tag=$1

	asset_id=$(curl "${curl_opts[@]}" -X GET $url | jq ".[] | select(.tag_name == \"$tag\") | .id")
	echo $asset_id
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"
	asset_id=$(get_release_id v$version)

	if [[ "$RELEASE_OS" =~ ^unsupported ]]; then
    	echo "This asdf plugin does not support your OS version."
		exit 1
	fi

	owner=$(echo "$GH_REPO" | cut -d'/' -f4)
	repo=$(echo "$GH_REPO" | cut -d'/' -f5)
	api_url="https://api.github.com/repos/$owner/$repo/releases/$asset_id/assets"

	echo "* Downloading $TOOL_NAME release $version..."
	assets=$(curl "${curl_opts[@]}" -X GET $api_url)
	url=$(echo $assets | jq ".[] | select(.name | contains(\"_$RELEASE_OS-\")) | select(.name | contains(\"-$RELEASE_ARCH\")) | .browser_download_url" | tr -d '"')
	echo "Got URL: ${url}"
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		# TODO: Assert N_m3u8DL-RE executable exists.
		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		chmod +x $install_path/$tool_cmd
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
