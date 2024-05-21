#!/bin/bash

# Mengecek jumlah argumen yang diberikan
if [ $# -ne 3 ]; then
    echo "Usage: $0 <public_key_file> <username> <server_ip>"
    exit 1
fi

# Menyimpan argumen ke dalam variabel
public_key_file=$1
username=$2
server_ip=$3

# Menjalankan perintah ssh-copy-id untuk menyalin public key ke server remote
ssh-copy-id -i "$public_key_file" "$username@$server_ip"

