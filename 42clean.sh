#!/bin/bash

# Author fooxcoder
# 42login : ayel-fil

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m' 
NC='\033[0m'

calculate_storage() {
  local storage=$(df -h "$HOME" | grep "$HOME" | awk '{print $4}')
  storage=$(echo $storage | tr -d 'i')
  echo $storage
}
storageBefore=$(calculate_storage)

if [ "$storageBefore" == "0BB" ];
then
	storageBefore="0B"
fi

chachFiles=(
  "$HOME/Library/*.42*"
  "$HOME/*.42*"
  "$HOME/.zcompdump*"
  "$HOME/.cocoapods.42_cache_bak*"
  "$HOME/.Trash/*"
  "$HOME/Library/Caches/*"
  "$HOME/Library/Application\ Support/Caches/*"
  "$HOME/Library/Application Support/Slack/Service Worker/CacheStorage/*"
  "$HOME/Library/Application Support/Slack/Cache/*"
  "$HOME/Library/Application Support/discord/Cache/*"
  "$HOME/Library/Application Support/discord/Code Cache/js*"
  "$HOME/Library/Application Support/discord/Crashpad/completed/*"
  "$HOME/Library/Application Support/Code/Cache/*"
  "$HOME/Library/Application Support/Code/CachedData/*"
  "$HOME/Library/Application Support/Code/Crashpad/completed/*"
  "$HOME/Library/Application Support/Code/User/workspaceStorage/*"
  "$HOME/Library/Application Support/Google/Chrome/Profile [0-9]/Service Worker/CacheStorage/*"
  "$HOME/Library/Application Support/Google/Chrome/Default/Service Worker/CacheStorage/*"
  "$HOME/Library/Application Support/Google/Chrome/Profile [0-9]/Application Cache/*"
  "$HOME/Library/Application Support/Google/Chrome/Default/Application Cache/*"
  "$HOME/Library/Application Support/Google/Chrome/Crashpad/completed/*"
  "$HOME/Library/Application\ Support/Chromium/Default/File\ System"
  "$HOME/Library/Application\ Support/Chromium/Profile\ [0-9]/File\ System"
  "$HOME/Library/Application\ Support/Google/Chrome/Default/File\ System"
  "$HOME/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/File\ System"
  "$HOME/Desktop/Piscine\ Rules\ *.mp4"
  "$HOME/Desktop/PLAY_ME.webloc"
)

for file in "${chachFiles[@]}"; do
  rm -rf $file &>/dev/null
done

storageAfter=$(calculate_storage)

if [ "$storageAfter" == "0BB" ];
then
	storageAfter="0B"
fi

printf "\033[0;31m╔═══════════════════\033[0;32m╦═══════════════════╗\n"
printf "\033[0;31m║      Before       \033[0;32m║      After        ║\n"
printf "\033[0;31m╠═══════════════════\033[0;32m╬═══════════════════╣\n"
printf "\033[0;31m║      %-13s\033[0;32m║      %-13s║\n" "$storageBefore" "$storageAfter"
printf "\033[0;31m║═══════════════════\033[0;32m╩═══════════════════╣\n"
printf "\033[1;33m║               Fooxcoder               ║\n"
printf "\033[1;33m╚═══════════════════════════════════════╝\n"

echo -e "contact me at: \033[4;34mcontact@fooxcoder.me\033[0m"
