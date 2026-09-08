#!/usr/bin/env bash

set -euo pipefail

: "${GRAMMAR_NAME:?GRAMMAR_NAME is required}"
: "${TARGET:?TARGET is required}"

ARCHIVE="tree-sitter-${GRAMMAR_NAME}-${TARGET}.tar.gz"

tar -czf "$ARCHIVE" -C dist .

echo "archive=$ARCHIVE" >> "$GITHUB_OUTPUT"
