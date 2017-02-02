#!/bin/bash

#setting MTU
echo "Current MTU: "
echo $(networksetup -getMTU en0)
 
networksetup -setMTU en0 1453
#genrating backups in wifi_backup on desktop
echo "Shutting down airport..."
sudo networksetup -setairportpower en0 off
sleep 1
mkdir ~/Desktop/wifi_backup
sudo cp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/Desktop/wifi_backup
sudo cp /Library/Preferences/SystemConfiguration/com.apple.network.eapolclient.configuration.plist ~/Desktop/wifi_backup
sudo cp /Library/Preferences/SystemConfiguration/com.apple.wifi.message-tracer.plist ~/Desktop/wifi_backup
sudo cp /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist ~/Desktop/wifi_backup
sudo cp /Library/Preferences/SystemConfiguration/preferences.plist ~/Desktop/wifi_backup

sudo rm /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist
sudo rm /Library/Preferences/SystemConfiguration/com.apple.eapolclient.plist 
sudo rm /Library/Preferences/SystemConfiguration/com.apple.wifi.message-tracer.plist 
sudo rm /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist 
sudo rm /Library/Preferences/SystemConfiguration/preferences.plist 

sleep 3
echo "Starting reboot....."
sudo reboot
