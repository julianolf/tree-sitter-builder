#!/usr/bin/env bash

set -euo pipefail

: "${GRAMMAR_NAME:?GRAMMAR_NAME is required}"
: "${TARGET:?TARGET is required}"

ARCHIVE="${GRAMMAR_NAME}-${TARGET}.tar.gz"

tar \
	--sort=name \
	--mtime="UTC 1970-01-01" \
	--owner=0 \
	--group=0 \
	--numeric-owner \
	-czf "${ARCHIVE}" \
	-C dist .
