#!/usr/bin/env bash

# Remote server details
HOST="a0dfc11ba139.a982e858.alu-cod.online"
USERNAME="a0dfc11ba139"

# Directory to be backed up
SOURCE_DIR="0323-RW-SOFEN-8120120-9_q1"

# Location for backup on the remote server
REMOTE_DIR="/home/sftp-student/03033/summative"

# Backup file name
BACKUP_FILE="${SOURCE_DIR}.tar.gz"

# Compress the source directory into a tarball
tar -czf "${BACKUP_FILE}" "${SOURCE_DIR}" || { echo "Failed to create backup."; exit 1; }

# Upload the backup file to the remote server using SCP
scp "${BACKUP_FILE}" "${USERNAME}@${HOST}:${REMOTE_DIR}" || { echo "Failed to upload backup to remote server."; exit 1; }

# Clean up the local backup file
rm "${BACKUP_FILE}" || { echo "Failed to delete local backup."; exit 1; }

echo "Backup completed successfully."
