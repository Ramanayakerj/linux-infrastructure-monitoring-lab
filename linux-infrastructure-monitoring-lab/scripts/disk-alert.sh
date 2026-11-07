
#!/bin/bash

# Linux Infrastructure Lab — Disk Alert
# Exit 0 = Healthy, exit 1 = Warning, exit 2 = Error

THRESHOLD="${1:-80}"

if ! [[ "$THRESHOLD" =~ ^[0-9]+$ ]] ||
   (( THRESHOLD < 1 || THRESHOLD > 100 )); then
    echo "ERROR: Threshold must be between 1 and 100"
    exit 2
fi

USAGE=$(df -P / | awk 'NR==2 {
    gsub("%", "", $5)
    print $5
}')

if ! [[ "$USAGE" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Unable to read disk usage"
    exit 2
fi

echo "================================"
echo " DISK MONITORING REPORT"
echo "================================"
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Disk Usage: ${USAGE}%"
echo "Alert Threshold: ${THRESHOLD}%"

if (( USAGE >= THRESHOLD )); then
    echo "WARNING: Disk usage threshold exceeded!"
    exit 1
else
    echo "OK: Disk usage is normal."
    exit 0
fi
