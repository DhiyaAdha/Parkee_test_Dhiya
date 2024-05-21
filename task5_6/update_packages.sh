#task 5

#!/bin/bash

# Mengecek package manager yang digunakan oleh sistem
if [ -x "$(command -v apt)" ]; then
    PACKAGE_MANAGER="apt"
    UPDATE_COMMAND="sudo apt update && sudo apt upgrade -y"
elif [ -x "$(command -v yum)" ]; then
    PACKAGE_MANAGER="yum"
    UPDATE_COMMAND="sudo yum update -y"
else
    echo "Package manager not found. Exiting."
    exit 1
fi

# Membuat log file untuk mencatat hasil pembaruan
LOG_FILE="/var/log/package_update.log"
touch $LOG_FILE

# Memperbarui semua paket dan mencatat hasilnya ke dalam log file
echo "[$(date)] Updating system packages using $PACKAGE_MANAGER" >> $LOG_FILE
echo "=========================================================" >> $LOG_FILE

$UPDATE_COMMAND >> $LOG_FILE 2>&1

echo "Paket berhasil diperbarui. Lihat log di $LOG_FILE"
