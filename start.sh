#!/bin/zsh

# Author fooxcoder
# 42login : ayel-fil
# This zsh script performs several setup tasks for a user's environment:
# It attempts to run a mount.sh script to mount a filesystem.
# It sets the system's appearance to dark mode.
# It adjusts the keyboard repeat rate for faster typing.
# It changes the desktop background to a specified image.
# It runs a 42clean.sh script to clean up the environment.

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' 


IMAGE_PATH=<IMAGE_PATH>
DIRHOME="/Users/${USER}/script42"
MOUNT_SCRIPT="$DIRHOME/mount.sh"
DARK_MODE_RESULT=$(osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true' 2>&1)
CLEAN_SCRIPT="$DIRHOME/42clean.sh"


if [ -x "$MOUNT_SCRIPT" ]; then
    echo -e "${YELLOW}[RUNNING] Running mount.sh...${NC}"
    "$MOUNT_SCRIPT"
else
    echo -e "${RED}[ERROR] mount.sh does not exist or is not executable.${NC}"
    exit 1
fi

if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}[SUCCESS] Dark mode set successfully.${NC}"
else
    echo -e "${RED}[ERROR] Failed to set dark mode: $DARK_MODE_RESULT${NC}"
fi

echo -e "${YELLOW}[RUNNING] Setting keyboard repeat rate...${NC}"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

if [ -f "$IMAGE_PATH" ]; then
    echo -e "${YELLOW}[RUNNING] Setting desktop background image...${NC}"
    osascript -e "tell application \"System Events\" to set picture of every desktop to POSIX file \"$IMAGE_PATH\""
else
    echo -e "${RED}[ERROR] The specified image does not exist at $IMAGE_PATH${NC}"
fi

if [ -x "$CLEAN_SCRIPT" ]; then
    echo -e "${YELLOW}[RUNNING] Running 42clean.sh...${NC}"
    "$CLEAN_SCRIPT"
else
    echo -e "${RED}[ERROR] 42clean.sh does not exist or is not executable.${NC}"
    exit 1
fi