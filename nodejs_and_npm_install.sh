# apt update: search for updates in the available repositories
sudo apt update
# installs nodejs
sudo apt install nodejs
#node -v: returns the current version of nodejs we are using
node -v
# apt install npm
sudo apt install npm
# n package: is a utility that lets us choose the specific version of nodejs we want to work with, we use npm to install it
sudo npm install -g n
# installs the latest version of nodejs
sudo n latest
# to remove a program
sudo apt remove nodejs

# install nvm (node version manager), this utility can install and manage different versions of nodejs, similar to "n"
# we will need cURL or Wget installed in our system to do this
sudo apt install curl
sudo apt install wget
# running either of the following commands downloads a script and runs it
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# installing nodejs through nvm, if the first time running this command we get an error we can reboot the terminal and try again
nvm install --lts

# create react.js app
# npx is a tool from npm
npx create-react-app thenameofmyapp
cd thenameofmyapp
npm start

# https://www.npmjs.com/
# https://nodejs.org/en/
# https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
