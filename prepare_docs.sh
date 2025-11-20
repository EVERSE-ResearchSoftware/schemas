#!/bin/bash

set -euo pipefail

# Base directory for docs output
DOCS_DIR="docs"
ROOT_DIR="."

rm -rf "$DOCS_DIR"
mkdir -p "$DOCS_DIR"

echo "Preparing documentation directory: $DOCS_DIR"

# Top-level schema directories to include
SCHEMA_DIRS=("quality_dimensions" "quality_indicators" "software")

for dir in "${SCHEMA_DIRS[@]}"; do
    if [ -d "$ROOT_DIR/$dir" ]; then
        echo "Processing $dir"
        cp -r "$ROOT_DIR/$dir" "$DOCS_DIR/$dir"
    else
        echo "Warning: directory $dir not found, skipping" >&2
    fi
done

echo "Documentation preparation complete. All files copied."
