#!/bin/bash

# Base directory for docs
DOCS_DIR="docs"
ROOT_DIR="."

rm -rf "$DOCS_DIR"
mkdir -p "$DOCS_DIR"

# Function to link readme files
link_readme() {
    local source_dir="$1"
    local target_dir="$2"
    
    # Create target directory
    mkdir -p "$target_dir"
    
    # Link main README if it exists
    if [ -f "$source_dir/README.md" ]; then
        ln -f "$source_dir/README.md" "$target_dir/index.md"
        echo "Linked $source_dir/README.md to $target_dir/index.md"
    fi
    
    # Add subdirectories
    for version_dir in "$source_dir"/*; do
        if [ -d "$version_dir" ]; then
            local dirname=$(basename "$version_dir")
            
            link_readme "$version_dir" "$target_dir/$dirname"
        fi
    done
}

# Link root README
ln -f "$ROOT_DIR/README.md" "$DOCS_DIR/index.md"
echo "Linked root README.md to $DOCS_DIR/index.md"

# Link schemas
link_readme "$ROOT_DIR/quality_dimensions" "$DOCS_DIR/quality_dimensions"
link_readme "$ROOT_DIR/quality_indicators" "$DOCS_DIR/quality_indicators"
link_readme "$ROOT_DIR/software" "$DOCS_DIR/software"

echo "Documentation preparation complete."
