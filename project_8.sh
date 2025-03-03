# Create a Script to Track Disk Usage
# And alerts Users when the thresholds 
# is surpasses by writing the message alert to the Log file

#!/bin/bash
# Set the alert threshold
THRESHOLDS=80
# Set the partion to root
PARTITION="/"
LOG_FILE="/var/log/alert_user.log"
# Get the total disk usage percentage on the root partition
USAGE=$(df -h "$PARTITION" | awk 'NR==2{print $5}'| tr -d '%')
# Get the current timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
# Check if the usage surpasses the threshold
if [[ "$USAGE" -gt "$THRESHOLDS" ]]; then
       MESSAGE="Alert!"
       echo "Threshold surpasses $MESSAGE-$TIMESTAMP" | tee -a "$LOG_FILE"
fi
