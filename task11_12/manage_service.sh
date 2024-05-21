#task 11

#!/bin/bash

# Pastikan ada dua argumen yang diberikan
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <action> <service_name>"
    echo "Available actions: start, stop, status"
    exit 1
fi

# Menentukan tindakan yang diminta
action=$1
service_name=$2

# Memeriksa apakah service_name valid (tersedia di sistem)
if ! systemctl list-units --type=service --all | grep -q "\<$service_name\>"; then
    echo "Error: Service '$service_name' not found."
    exit 1
fi

# Menjalankan aksi yang diminta
case "$action" in
    start)
        sudo systemctl start "$service_name"
        ;;
    stop)
        sudo systemctl stop "$service_name"
        ;;
    status)
        sudo systemctl status "$service_name"
        ;;
    *)
        echo "Invalid action. Available actions: start, stop, status"
        exit 1
        ;;
esac
