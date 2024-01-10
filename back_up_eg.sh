#!/bin/bash

# Check for exactly 2 arguments using $#
if [ $# -ne 2 ]; then
    echo "Usage: backup_eg.sh <source_dir> <target_dir>"
    echo "Please try again"
    exit 1
fi

# Check if rsync is installed
if ! command -v rsync > /dev/null 2>&1; then
    echo "This script requires rsync to be installed. Please install it and try again."
    exit 2
fi

# Get the current date in the format YYYY-MM-DD
current_date=$(date +%Y-%m-%d)

# Rsync options for backup
rsync_options="-avb --backup-dir $2/$current_date --delete " #--delete helps ensure that the backup is an exact replica of the source, with no obsolete or removed files. 
# the b option here helps keep the deleted files in a backup directory 

# Run rsync command (Note: run with --dry-run for testing, remove it for actual synchronization)
$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log
