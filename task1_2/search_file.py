#task 1

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <extension>"
    exit 1
fi

directory=$1
extension=$2

if [ ! -d "$directory" ]; then
    echo "Directory $directory does not exist."
    exit 1
fi

# Mencari file dengan ekstensi yang diberikan di dalam direktori
found_files=$(find "$directory" -type f -name "*.$extension")

if [ -n "$found_files" ]; then
    echo "Found files:"
    echo "$found_files"
else
    echo "No files found with extension $extension"
fi
