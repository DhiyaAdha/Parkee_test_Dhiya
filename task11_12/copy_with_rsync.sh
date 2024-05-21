#!/bin/bash

# Memeriksa jumlah argumen
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_file> <username> <ip_address>"
    exit 1
fi

# Menentukan variabel
source_file=$1
username=$2
ip_address=$3

# Melakukan salinan menggunakan rsync
rsync -avz --progress "$source_file" "$username"@"$ip_address":~/ || echo "Rsync failed."
