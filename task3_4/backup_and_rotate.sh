#!/bin/bash

# Mengecek apakah jumlah parameter sudah benar
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Mendapatkan parameter
SOURCE_DIR=$1
DEST_DIR=$2

# Mengecek apakah direktori sumber ada
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

# Mengecek apakah direktori tujuan ada
if [ ! -d "$DEST_DIR" ]; then
    echo "Destination directory does not exist: $DEST_DIR"
    exit 1
fi

# Membuat nama file backup dengan timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${DEST_DIR}/backup_${TIMESTAMP}.tar.gz"

# Membuat backup dari direktori sumber
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed"
    exit 1
fi

# Menghapus backup yang lebih lama dari 7 hari
find "$DEST_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;
echo "Old backups removed"

exit 0
