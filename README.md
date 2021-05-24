# docker-semantic-release

[![Build status](https://badge.buildkite.com/86e20f73ca3d5c318e626f7aadc69dc4725154755ee104ce96.svg?branch=master)](https://buildkite.com/rokerlabs/semantic-release)

Docker image for <a href="https://github.com/semantic-release/semantic-release"><code>semantic-release</code></a>.

## Available plugins
---

| Name | Description |
| ---- | ----------- |
| changelog | [Create or update a changelog file](https://github.com/semantic-release/changelog) |
| exec | [Execute custom shell commands](https://github.com/semantic-release/exec) |
| git | [Commit release assets to the project's git repository](https://github.com/semantic-release/git) |

## Usage in CI
---

Example usage is various CI platforms.

### Buildkite
```yaml
  - label: ":git: Semantic Version Release"
    branches: master
    plugins:
      - docker#v3.8.0:
          image: rokerlabs/semantic-release:<version>
          mount-ssh-agent: true
          propagate-environment: true
          environment:
            - GITHUB_TOKEN
```

## Copyright

Copyright (c) 2021 Roker Labs. See [LICENSE](./LICENSE) for details.