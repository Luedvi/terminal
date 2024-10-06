# download and install chrome
sudo apt update
sudo apt upgrade
# wget: is a free utility for non-interactive download of files from the Web
wget --version
# if we don't have it installed we do
sudo apt install wget
# and download our file from the webpage
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# dpkg:package manager for debian distros, is the backend of apt command. With this command we install the .deb package we just downloaded
sudo dpkg -i google-chrome-stable_current_amd64.deb
# if we get an error in the installation we could use
sudo apt-get install -f
# finally run the program
google-chrome
