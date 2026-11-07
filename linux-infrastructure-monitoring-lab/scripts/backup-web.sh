
#!/bin/bash
set -euo pipefail

BACKUP_DIR="/var/backups/infrastructure-lab"
TIMESTAMP=$(date -u +%Y%m%d-%H%M%S)
BACKUP_FILE="$BACKUP_DIR/web-backup-$TIMESTAMP.tar.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Create backup from the root directory
tar -czf "$BACKUP_FILE" -C / \
    var/www/infra-portal \
    etc/nginx/sites-available/infra-portal

# Secure the backup
chmod 600 "$BACKUP_FILE"

# Verify backup
tar -tzf "$BACKUP_FILE" > /dev/null

echo "================================"
echo " BACKUP COMPLETED SUCCESSFULLY"
echo "================================"
echo "Backup file: $BACKUP_FILE"
du -h "$BACKUP_FILE"


echo "Removing backups older than 7 days..."

find "$BACKUP_DIR" \
  -maxdepth 1 \
  -type f \
  -name 'web-backup-*.tar.gz' \
  -mtime +6 \
  -print -delete

echo "Backup retention completed."
