#!/bin/bash

old_downloads=$(find ~/Downloads/* -mtime +30 -type f)

if [ -z "$old_downloads" ]; then
    echo "No old downloads found."
    exit
fi

echo "The following files are older than 30 days:"
echo "$old_downloads"
echo ""

read -p "Do you want to delete these files? [y/n] " choice
case "$choice" in
    y|Y )
        find ~/Downloads/* -mtime +30 -type f -delete
        echo "Old downloads deleted."
        ;;
    n|N )
        echo "Old downloads not deleted."
        ;;
    * )
        echo "Invalid choice. Old downloads not deleted."
        ;;
esac