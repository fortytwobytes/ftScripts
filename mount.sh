#!/bin/bash

# Author fooxcoder
# 42login : ayel-fil
#description:
# This Bash script uses rclone to mount a remote filesystem to a local directory if it isn't already mounted.
# It logs the mount operation's output, reports success or failure, and provides feedback through color-coded terminal messages.

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m' 
NC='\033[0m'

DIR="/Users/${USER}/"
CLON=<DIR_NAME>
LOG_FILE="${DIR}mount.log"

echo -e "${YELLOW}[RUNNING] Checking if ${CLON} is already mounted.${NC}"

if ! mount | grep -q "on ${DIR}${CLON} "; then
  echo -e "${YELLOW}[RUNNING] ${CLON} not mounted, starting mount operation.${NC}"

  MOUNT_COMMAND="${DIR}rclone mount ${CLON}:cursus ${DIR}${CLON} --vfs-cache-mode full --cache-dir ${DIR}goinfre --buffer-size 1G --vfs-read-chunk-size 32M --vfs-read-chunk-size-limit off --dir-cache-time 72h"
  
  if eval $MOUNT_COMMAND &> "$LOG_FILE"; then
    echo -e "${GREEN}[SUCCESS] Mount operation was successful.${NC}"
  else
    echo -e "${RED}[ERROR] Mount operation failed. Check $LOG_FILE for details.${NC}"
    exit 1
  fi
else
  echo -e "${GREEN}[SUCCESS] ${CLON} is already mounted.${NC}"
fi

echo -e "${GREEN}[SUCCESS] Script execution completed.${NC}"
