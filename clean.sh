storageBefore=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')

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

# loop through array and remove each file/directory
for file in "${chachFiles[@]}"; do
  rm -rf "$file" &>/dev/null
done

storageAfter=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')

if [ "$storageAfter" == "0BB" ];
then
	storageAfter="0B"
fi

printf "╔═══════════════════╦═══════════════════╗\n"
printf "║      Before       ║      After        ║\n"
printf "╠═══════════════════╬═══════════════════╣\n"
printf "║      %-13s║      %-13s║\n" "$storageBefore" "$storageAfter"
printf "╚═══════════════════╩═══════════════════╝\n"

