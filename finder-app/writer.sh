#!/bin/bash

# Check if arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Missing parameters"
    exit 1
fi

writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the file, overwriting if it exists
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Could not create the file"
    exit 1
fi

