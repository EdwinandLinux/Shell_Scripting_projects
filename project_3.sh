#!/bin/bash
# Compare time between starting and ending while copying file
# Small number of files will not have a same time
# large number of files will have a difference

MYLOG=$1
START_TIME=$(date +"%D %T")

echo " Starting time: $START_TIME" >> /home/$USER/$MYLOG
echo "Creating backup directory" >> /home/$USER/$MYLOG
mkdir /home/$USER/work_backup1:
echo "Copying Files" >>  /home/$USER/$MYLOG
cp -r /home/$USER/work/* /home/$USER/work_backup/ >>  /home/$USER/$MYLOG

ENDING_TIME=$(date +"%D %T")

echo "Finished Copying Files" >>  /home/$USER/$MYLOG
echo " after $ENDING_TIME" >>  /home/$USER/$MYLOG

# Run the script 
# chmod +x ./project_3.sh
# ./project_3.sh
