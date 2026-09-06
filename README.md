# Tree-sitter Builder

Reusable GitHub Actions workflow for building and packaging Tree-sitter grammars for:

- Linux amd64
- Linux arm64
- macOS arm64

Each grammar is published as a versioned GitHub Release containing platform-specific archives.

## Usage

In a grammar repository, create `.github/workflows/release.yml`:

```yaml
name: Release

on:
  push:
    tags:
      - "v*"

permissions:
  contents: write

jobs:
  build:
    uses: julianolf/tree-sitter-builder/.github/workflows/build-grammar.yml@main
    with:
      grammar-name: zig
```
