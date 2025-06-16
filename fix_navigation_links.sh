#!/bin/bash

# Script to fix navigation links in all chapter files
# This script replaces ".md" with "/" in navigation links

echo "Fixing navigation links in all chapter files..."

# Function to fix navigation links in a file
fix_navigation_links() {
    local file="$1"
    echo "Processing file: $file"
    
    # Replace .md with / in navigation links
    sed -i 's/\.md" class="nav-link/\/" class="nav-link/g' "$file"
}

# Process all languages
process_languages() {
    # Get all directories under docs
    dirs=$(find "docs" -type d -name "Infopsychismus_*" -o -name "Infopsiquismo_*" -o -name "Infopsychisme_*" -o -name "Infopsichismo_*" -o -name "Infopsikhizm_*" -o -name "Infopsisizm_*")
    
    # Process each directory
    for dir in $dirs; do
        echo "Processing directory: $dir"
        
        # Find all markdown files in the directory
        markdown_files=$(find "$dir" -name "*.md")
        
        # Process each markdown file
        for file in $markdown_files; do
            fix_navigation_links "$file"
        done
    done
}

# Call the function to process all languages
process_languages

echo "Navigation links fixed successfully."
