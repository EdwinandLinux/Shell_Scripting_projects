# Create a Bash Script to add or remove Users.
#  Add Users to a Secondary Group
# Log all changes

#!/bin/bash

LOG="/var/log/log_file.log"

# Function for auditing
log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1 " | tee -a "$LOG"
}

# Function to add a user
add_user() {
    local username=$1
    local groupname=$2
    if id "$username" &>/dev/null; then
        log "User: $username already exists."
    else
        sudo useradd -m -s /bin/bash "$username"
        log "User: $username added successfully."
        if [[ -n "$groupname" ]]; then
            sudo groupadd "$groupname"
            sudo usermod -aG "$groupname" "$username"
            log "User : $username added to group $groupname"
        fi 
    fi
}

# Function to remove a user
remove_user() {
    local username=$1
    if id "$username" &>/dev/null; then
        
        sudo userdel  "$username"
        log "User: $username was removed successfully."
    else
        log "User: $username does not exists"
    fi
}

# Main function
echo "##########################"
echo -e "\tUser Management"
echo "###########################"
echo " 1- Add User"
echo " 2- Remove User"
read -p "Choose an option(1-2): " option
if [[ "$option" == "1" ]]; then
    read -p "Enter the username to add: " username
    read -p "Enter group name: " groupname
    add_user "$username" "$groupname"
elif [[ "$option" == "2" ]]; then 
     read -p "Enter username to remove: " user
     remove_user "$user"
else
    log "Invalid option selected."
fi
    