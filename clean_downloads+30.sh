#!/bin/bash

# This script is designed to clean up the ~/Downloads directory by finding and offering to delete files that are older than 30 days. 
# It provides a summary of the files to be deleted and requests user confirmation before proceeding with the deletion. 
# The script uses a single find command to locate old files and utilizes xargs for efficient file removal.

target_directory=$HOME/Downloads
file_age_days=30

old_downloads=$(find "$target_directory" -type f -mtime +"$file_age_days")

if [ -z "$old_downloads" ]; then
    echo "No old downloads found."
    exit 0
fi

echo "The following files are older than $file_age_days days:"
echo "$old_downloads"
echo ""

read -p "Do you want to delete these files? [y/n] " choice

case "$choice" in
    y|Y )
        echo "$old_downloads" | xargs rm
        echo "Old downloads deleted."
        ;;
    n|N )
        echo "Old downloads not deleted."
        ;;
    * )
        echo "Invalid choice. Old downloads not deleted."
        ;;
esac
