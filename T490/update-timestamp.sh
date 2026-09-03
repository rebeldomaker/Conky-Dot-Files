# Run this in terminal first: sudo nvim /usr/local/bin/update-timestamp.sh
#!/bin/bash

# Run the apt-get update command
sudo apt-get update

# Add the current date and time to the update timestamp file
date +"%d-%m-%Y %H:%M:%S" >> ~/.last_update_times

# Keep only the last 3 timestamps for update
tail -n 3 ~/.last_update_times > ~/.last_update_times.tmp
mv ~/.last_update_times.tmp ~/.last_update_times

# Run the apt-get upgrade command
sudo apt-get upgrade -y

# Add the current date and time to the upgrade timestamp file
date +"%d-%m-%Y %H:%M:%S" >> ~/.last_upgrade_times

# Keep only the last 3 timestamps for upgrade
tail -n 3 ~/.last_upgrade_times > ~/.last_upgrade_times.tmp
mv ~/.last_upgrade_times.tmp ~/.last_upgrade_times


# Afterwards saving this file, run: sudo chmod +x /usr/local/bin/update-upgrade-timestamp.sh
# crontab -e
# Add the following line:
# 0 9 * * * /usr/local/bin/update-timestamp.sh

