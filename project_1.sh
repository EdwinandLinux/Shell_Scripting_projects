##  Install Git on different Operating Systems

# Function to install Git on macOS
install_git_macOS(){
    # Display aa message
    echo "Installing Git om macOS...."   
    # Check if brew (Homebrew package manager)is installed and redirects the standart output or error to /dev/null
    if command -v brew > /dev/null 2>&1 ; then
         brew install git
    else
        echo "Homebrew is not found."
        echo "Installing Homebrew now..."
        # Called the bash shell and read and execute the string
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # Install Git on macOS
        brew install git
        fi
        # Check if the last command runned succesfully
        if [[ $? -eq 0 ]]; then
          echo " Git was installed successfully on macOS."
        else
           echo "Failed to install Git on macOS."
        fi        
}

# Function to install Git on Windows using WSL
# Need to install WSL on Windows

install_git_window() {
    echo "Installing Git through WSL on Windows.."
    sudo apt update
    sudo apt install -y git
    if [[ $? -eq 0 ]]; then 
       echo " Git installed successfully on Windows."
    else
        echo " Git was not installed in Windows."
    fi       

}

# Function to install Git on Red Hat Enterprise Linux
install_git_rhel(){
     echo "Installing Git  on RHEL.."
     sudo yum install -y git
    if [[ $? -eq 0 ]]; then 
        echo "Git installed successfully on RHEL."
    else
        echo "Git was not installed  on RHEL."
    fi
}


# Menu to select the OS
echo " Choose the Operation System to install."
echo " 1 - macOS"
echo " 2 - RHEL"
echo "3 - Windows"
read -p " Make your choice[1-3]: " choice

case $choice in 
1)
install_git_macOS();;
2)
install_git_rhel();;
3)
install_git_window();;
*)
echo "Invalid choice, please select [1-3]"
esac

