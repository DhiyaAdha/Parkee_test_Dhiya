#task2

#!/bin/bash

# Mengecek jumlah parameter yang diberikan
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <backup_location>"
    exit 1
fi

source_dir=$1
backup_location=$2

if [ ! -d "$source_dir" ]; then
    echo "Source directory $source_dir does not exist."
    exit 1
fi

if [ ! -d "$backup_location" ]; then
    mkdir -p "$backup_location"
fi

timestamp=$(date +"%Y%m%d%H%M%S")
backup_name=$(basename "$source_dir")
backup_file="$backup_location/${backup_name}_${timestamp}.tar.gz"

tar -czf "$backup_file" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"

echo "Backup successful! File saved as $backup_file"