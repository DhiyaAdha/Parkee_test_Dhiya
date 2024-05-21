#!/bin/bash

# Path to log file
LOG_FILE="/var/log/cpu_monitor.log"

# Threshold CPU usage percentage (75%)
THRESHOLD=75

# Get the current average CPU usage for the last minute
CPU_USAGE=$(sar -u 1 1 | awk '/Average:/ {print 100 - $NF}')

# Compare CPU usage with the threshold
if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    # Log CPU usage information
    echo "$(date +"%Y-%m-%d %H:%M:%S"): CPU usage above threshold: $CPU_USAGE%" >> $LOG_FILE
fi
