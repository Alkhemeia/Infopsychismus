#!/bin/bash

# Function to fix navigation links in a file
fix_file_links() {
    local file="$1"
    
    # Replace navigation links with correct format
    # From: <a href="XX_Chapter_Name/" class="nav-link...">
    # To:   <a href="../XX_Chapter_Name/" class="nav-link...">
    
    # Use sed to replace the links
    sed -i 's/<a href="\([0-9]\{2\}_[^"]*\/\)" class="nav-link/<a href="..\/\1" class="nav-link/g' "$file"
}

# Process main book chapters
echo "Fixing navigation links in main book chapters..."
find "$(pwd)/docs/Infopsychismus_Book" -name "*.md" -type f | while read -r file; do
    echo "Processing $file"
    fix_file_links "$file"
done

# Process language directories if they exist
echo "Fixing navigation links in language directories..."
for lang_dir in $(pwd)/docs/languages/*/; do
    lang=$(basename "$lang_dir")
    echo "Processing language: $lang"
    
    # Look for book directories within each language folder
    find "$lang_dir" -path "*/*/[0-9][0-9]_*.md" -type f | while read -r file; do
        echo "Processing $file"
        fix_file_links "$file"
    done
done

echo "All navigation links have been fixed!"
