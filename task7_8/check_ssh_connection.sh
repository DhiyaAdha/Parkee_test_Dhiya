# task 8

#!/bin/bash

# Mengecek jumlah argumen yang diberikan
if [ $# -ne 2 ]; then
    echo "Usage: $0 <username> <server_ip>"
    exit 1
fi

# Menyimpan argumen ke dalam variabel
username=$1
server_ip=$2

# Mencoba melakukan koneksi SSH ke server remote
if ssh -q -o "BatchMode=yes" "$username@$server_ip" exit; then
    echo "Connection to $server_ip successful."
else
    echo "Connection to $server_ip failed."
fi
