#!/bin/bash

# Check if the directory is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory_path>"
  exit 1
fi

directory=$1
if [! -d "$directory" ]; then
  echo "Error: Directory $directory does not exist"
  exit 1
fi

# Traverse the directory recursively and count file types
echo "File Type Counts:"
find "$directory" -type f -print | awk -F '.' '{print tolower($NF)}' | sort | uniq -c | sort -rn | awk '{printf "%-10s %s\n", $2, $1}'
