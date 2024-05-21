#!/bin/bash

# Pastikan dua parameter telah diberikan
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <unique_string> <username>"
    exit 1
fi

unique_string=$1
username=$2
authorized_keys="/home/$username/.ssh/authorized_keys"

# Periksa apakah file authorized_keys ada untuk pengguna yang bersangkutan
if [ ! -f "$authorized_keys" ]; then
    echo "Error: authorized_keys not found for user $username"
    exit 1
fi

# Backup file authorized_keys
cp "$authorized_keys" "$authorized_keys.bak"

# Hapus baris yang mengandung string unik dari file authorized_keys
sed -i "/$unique_string/d" "$authorized_keys"

echo "Public key containing '$unique_string' removed from authorized_keys for user $username"
