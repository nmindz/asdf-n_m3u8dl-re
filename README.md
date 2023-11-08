<div align="center">

# asdf-n_m3u8dl-re [![Build](https://github.com/nmindz/asdf-n_m3u8dl-re/actions/workflows/build.yml/badge.svg)](https://github.com/nmindz/asdf-n_m3u8dl-re/actions/workflows/build.yml) [![Lint](https://github.com/nmindz/asdf-n_m3u8dl-re/actions/workflows/lint.yml/badge.svg)](https://github.com/nmindz/asdf-n_m3u8dl-re/actions/workflows/lint.yml)

[n_m3u8dl-re](https://github.com/nilaoda/N_m3u8DL-RE) plugin for the [asdf version manager](https://asdf-vm.com).

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
asdf plugin add n_m3u8dl-re
# or
asdf plugin add n_m3u8dl-re https://github.com/nmindz/asdf-n_m3u8dl-re.git
```

n_m3u8dl-re:

```shell
# Show all installable versions
asdf list-all n_m3u8dl-re

# Install specific version
asdf install n_m3u8dl-re latest

# Set a version globally (on your ~/.tool-versions file)
asdf global n_m3u8dl-re latest

# Now n_m3u8dl-re commands are available
n_m3u8dl-re --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/nmindz/asdf-n_m3u8dl-re/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Evandro Camargo](https://github.com/nmindz/)
