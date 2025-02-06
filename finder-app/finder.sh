#!/bin/bash

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Missing parameters"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory"
    exit 1
fi

# Initialize counters
file_count=0
matching_lines=0

# Iterate through files in the directory and subdirectories
for file in $(find "$filesdir" -type f); do
    ((file_count++))
    # Count lines containing the search string in each file
    matching_lines_in_file=$(grep -c "$searchstr" "$file")
    ((matching_lines += matching_lines_in_file))
done

# Output the result
echo "The number of files are $file_count and the number of matching lines are $matching_lines"

