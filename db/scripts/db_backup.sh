#!/bin/bash


# MySQL credentials
DB_USER="$REDMINE_DB_USER"
DB_PASS="$REDMINE_DB_PASSWORD"
DB_NAME="$REDMINE_DB_NAME"

# Backup directory and filename
BACKUP_DIR="/media/backup/"
TIMESTAMP=$(date "+%Y_%m_%d_%H_%M_%S")
BACKUP_FILE="$BACKUP_DIR/redmine_db_dump_$TIMESTAMP.sql"

# MySQL dump command
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully. File: $BACKUP_FILE"
else
  echo "Backup failed."
fi

