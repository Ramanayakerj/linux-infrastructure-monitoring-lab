#!/bin/bash

echo "================================"
echo " LINUX SERVER HEALTH REPORT"
echo "================================"

echo "Hostname: $(hostname)"
echo "Date: $(date)"

echo
echo "===== SYSTEM UPTIME ====="
uptime

echo
echo "===== MEMORY ====="
free -h

echo
echo "===== DISK ====="
df -h /

echo
echo "===== NGINX STATUS ====="
systemctl is-active nginx

echo
echo "===== NODE EXPORTER STATUS ====="
systemctl is-active prometheus-node-exporter

echo
echo "===== WEBSITE STATUS ====="
curl -s -o /dev/null -w 'HTTP Status: %{http_code}\n' \
  --max-time 5 http://localhost/ || echo "Website check failed"
