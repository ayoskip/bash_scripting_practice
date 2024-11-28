#!/bin/bash

# Log the start time of the update
echo "Update started at: $(date)" >> /var/log/daily_update.log

# Update the package list
sudo apt-get update >> /var/log/daily_update.log 2>&1

# Upgrade the packages
sudo apt-get upgrade -y >> /var/log/daily_update.log 2>&1

# Check if a reboot is required
if [ -f /var/run/reboot-required ]; then
    echo "Reboot required. System will reboot now." >> /var/log/daily_update.log
    sudo reboot
else
    echo "No reboot required." >> /var/log/daily_update.log
fi

# Log the end time of the update
echo "Update completed at: $(date)" >> /var/log/daily_update.log
