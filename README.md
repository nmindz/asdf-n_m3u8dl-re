<div align="center">

# asdf-N_m3u8DL-RE [![Build](https://github.com/nmindz/asdf-N_m3u8DL-RE/actions/workflows/build.yml/badge.svg)](https://github.com/nmindz/asdf-N_m3u8DL-RE/actions/workflows/build.yml) [![Lint](https://github.com/nmindz/asdf-N_m3u8DL-RE/actions/workflows/lint.yml/badge.svg)](https://github.com/nmindz/asdf-N_m3u8DL-RE/actions/workflows/lint.yml)

[N_m3u8DL-RE](https://github.com/nilaoda/N_m3u8DL-RE) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add N_m3u8DL-RE
# or
asdf plugin add N_m3u8DL-RE https://github.com/nmindz/asdf-N_m3u8DL-RE.git
```

N_m3u8DL-RE:

```shell
# Show all installable versions
asdf list-all N_m3u8DL-RE

# Install specific version
asdf install N_m3u8DL-RE latest

# Set a version globally (on your ~/.tool-versions file)
asdf global N_m3u8DL-RE latest

# Now N_m3u8DL-RE commands are available
N_m3u8DL-RE --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/nmindz/asdf-N_m3u8DL-RE/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Evandro Camargo](https://github.com/nmindz/)
