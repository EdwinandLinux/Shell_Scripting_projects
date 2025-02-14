# Automate backup of a directory at a regular intervals of time  

#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
echo "$timestamp"
# Ask the user for the directory to back up
read -p " Enter the directory you want to back up: " source_dir
# Validate if the directory exists
if [[ ! -d "$source_dir" ]] ; then
    echo " $source_dir does not exist."
    exit 1
fi
# Back up destination
read -p "Enter the back up destination" dest_dir
dest=$(sudo mkdir -p "$HOME/$dest_dir/backups")
# Archived and compressed the directory with gzip
tar -cvzf "$dest$timestamp.tar.gz" "$source_dir"

# Create a cron job to run the script at 1:00 AM everyday
# 1 - crontab -e 
# 2 - 0 1 * * * /path/to/project_5.sh