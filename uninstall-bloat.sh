#!/bin/bash
GREEN='\033[0;32m';
DEFAULT='\033[0m';
YELLOW='\033[1;33m';
CYAN='\033[0;36m';

tv_local_ip='your tv local ip';

echo "[🔌] Disconnecting from ADB in case is connected somewhere else";
adb disconnect;
echo " ";

echo "[🌐] Connecting to ADB on ${GREEN}$tv_local_ip${DEFAULT}:${YELLOW}5555${DEFAULT}";
adb connect $tv_local_ip:5555 || echo " " && echo "[❗] Please check the TV, enable USB debugging and allow this ADB connection!" && echo "[❗] The script will continue automatically after you allow the connection!";
adb wait-for-device;
echo " ";

secs=$((3));
while [ $secs -gt 0 ]; do
    printf "\r[⌛] Starting to purge the bloated apps in ${YELLOW}$secs${DEFAULT} seconds...";
    sleep 1;
    : $((secs--));
done;

echo " ";
echo " ";
echo "[📝] Purging the bloated apps...";
echo " ";

cat bloat.txt | while read line; do
    echo "[👀] Trying to remove ${CYAN}$line${DEFAULT} if is installed";
    adb uninstall --user 0 $line && adb shell pm clear $line;
    echo " ";
    sleep 0.5;
done;

echo "[👌] Done! Please restart your TV after running this script!";
echo "[🔌] Disconnecting from ADB again.";
adb disconnect;
