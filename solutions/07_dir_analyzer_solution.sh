#!/bin/bash

target_dir="${1:-.}"

if [ ! -d "$target_dir" ]; then
    echo -e "Error: '$target_dir' is not a valid directory" >&2
    exit 1
fi

if [ ! -r "$target_dir" ]; then
    echo -e "Error: No permission to read '$target_dir'" >&2
    exit 2
fi

echo -e "Analyzing: $target_dir"
echo "--------------------------------"

file_count=$(find "$target_dir" -maxdepth 1 -type f | wc -l)
dir_count=$(find "$target_dir" -maxdepth 1 -type d | tail -n +2 | wc -l)

echo -e "Total Files: $file_count"
echo -e "Subdirectories: $dir_count"

newest=$(find "$target_dir" -maxdepth 1 -type f -printf "%T@ %f\n" | sort -n | tail -1 | cut -d' ' -f2-)
oldest=$(find "$target_dir" -maxdepth 1 -type f -printf "%T@ %f\n" | sort -n | head -1 | cut -d' ' -f2-)

largest=$(find "$target_dir" -maxdepth 1 -type f -printf "%s %f\n" | sort -nr | head -1)
largest_name=$(echo "$largest" | awk '{print $2}')

echo -e "Newest File: ${newest:-N/A}"
echo -e "Oldest File: ${oldest:-N/A}"
echo -e "Largest File: ${largest_name:-N/A}"