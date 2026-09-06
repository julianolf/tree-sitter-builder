#!/usr/bin/env bash

set -euo pipefail

: "${GRAMMAR_NAME:?GRAMMAR_NAME is required}"
: "${EXTENSION:?EXTENSION is required}"

if [[ ! -f grammar.js && ! -f grammar.json ]]; then
	echo "error: grammar.js or grammar.json not found" >&2
	exit 1
fi

rm -rf dist
mkdir -p "dist/parser" "dist/queries/${GRAMMAR_NAME}"

tree-sitter generate --js-runtime native
tree-sitter build --output "dist/parser/${GRAMMAR_NAME}.${EXTENSION}"

if [[ -d queries ]]; then
	cp -a queries/. "dist/queries/${GRAMMAR_NAME}/"
fi
