# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

# TODO: adapt this
asdf plugin test n_m3u8dl-re https://github.com/nmindz/asdf-n_m3u8dl-re.git "n_m3u8dl-re --help"
```

Tests are automatically run in GitHub Actions on push and PR.
