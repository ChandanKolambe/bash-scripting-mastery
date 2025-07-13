#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Please specify a filename"
    exit 1
fi

target_file="$1"

if [ -f "$target_file" ] && [ -r "$target_file" ]; then
    size=$(du -h "$target_file" | cut -f1)
    modified=$(date -r "$target_file" "+%Y-%m-%d %H:%M:%S")
   
    echo "File found: $target_file"
    echo "Size: $size"
    echo "Last Modified: $modified"
    exit 0
else
    echo "File not found or not readable: $target_file"
    echo "Looking for similar files..."
    similar_files=$(find . -maxdepth 1 -name "*${target_file}*" -print | head -3)
   
    if [ -n "$similar_files" ]; then
        echo "Maybe you meant:"
        echo "$similar_files" | sed 's/^\.\//- /'
    else
        echo "No similar files found in current directory"
    fi
   
    exit 2
fi