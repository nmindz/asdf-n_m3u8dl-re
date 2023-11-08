# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test N_m3u8DL-RE https://github.com/nmindz/asdf-N_m3u8DL-RE.git "N_m3u8DL-RE --help"
```

Tests are automatically run in GitHub Actions on push and PR.
