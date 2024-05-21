#!/bin/bash

# Path to the Python script
PYTHON_SCRIPT_PATH="/path/to/simple_script.py"

# Path to the systemd unit file
SYSTEMD_UNIT_FILE="/etc/systemd/system/simple_script.service"

# Create the systemd unit file
cat <<EOF > $SYSTEMD_UNIT_FILE
[Unit]
Description=Simple Python Script

[Service]
Type=simple
ExecStart=/usr/bin/python3 $PYTHON_SCRIPT_PATH
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd daemons to recognize the new unit file
systemctl daemon-reload

echo "Systemd unit file created at $SYSTEMD_UNIT_FILE"
