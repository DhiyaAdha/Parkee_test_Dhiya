#!/bin/bash

# Mengizinkan semua koneksi keluar
iptables -P OUTPUT ACCEPT

# Mengizinkan koneksi masuk ke port 22 (SSH), 80 (HTTP), dan 443 (HTTPS)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -A INPUT -j REJECT

iptables-save > /etc/iptables/rules.v4
