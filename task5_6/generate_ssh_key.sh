#task6

#!/bin/bash

# Cek apakah argumen direktori telah diberikan
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Menyimpan argumen direktori dalam sebuah variabel
directory=$1

# Membuat direktori jika belum ada
if [ ! -d "$directory" ]; then
    mkdir -p "$directory"
    echo "Directory $directory created."
fi

# Generate SSH key pair
ssh-keygen -t rsa -b 2048 -f "$directory/id_rsa" -q -N ""

echo "SSH key pair generated and saved in $directory."

