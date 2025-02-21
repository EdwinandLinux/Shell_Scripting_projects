# Log File Analyzer

#! /bin/bash
# Log file location on RHEL
LOG_FILE= "/var/log/cron"
#log_file="Jan 30 09:15:11 localhost CRON[12345]: (root) CMD (/usr/bin/ssh)"
# Check if the log file exists
if [[ ! -f "$LOG_FILE" ]] ; then
    echo " Log file does not exists."
    exit 1
fi
# Display the header of the table
echo -e "Month\tDate\tSever Name\tService_ID\tMessage"
echo -e "-------------------------------------------------------"

# Parse the log file
grep CRON "$LOG_FILE" | while read -r log_line; do
     # Extract the Month
     MONTH=$(echo "$line" | awk '{print $1}')
     # Extract the Date
     DATE=$(echo "$log_file" | awk '{print $2}')
     # Extract the Server Name
     SERVER_NAME=$(echo "$log_file" | awk '{print $4}')
     # Extract Message from 5th field to the end
     MESSAGE=$(echo "$log_file" | cut -d ' ' -f6-)
     # Extract Service
     SERVICE_ID=$(echo "$log_file" | awk -F '[][]' '{print $2}'| cut -d ' ' -f1)
     # Display the data in tabular format
     echo -e "$MONTH\t$DATE\t$SERVER_NAME\t$SERVICE_ID\t$MESSAGE"
     done
     # Example of log file : Jan 30 09:15:11 localhost CRON[12345]: (root) CMD (/usr/bin/ssh)
     # Warning: For some reason the command : MONTH=$(echo "$line" | awk '{print $1}') does not print Jan