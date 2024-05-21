#!/bin/bash

THRESHOLD=80

DISK_USAGE=$(df -h --output=pcent / | awk 'NR==2 {sub("%","",$1); print $1}')

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    # Send notification (example using sendmail)
    echo "Warning: Disk usage is above $THRESHOLD% on $(hostname)!" | sendmail user@example.com
fi
