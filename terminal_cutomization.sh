# we can choose many terminal emulators
sudo apt install tilix
# we can install more shells in our system
sudo apt install zsh
# chsh: changes the user login shell. This determines the name of the user's initial login command. A normal user may only change the login shell for her own account; the superuser may change the login shell for any account
chsh -s $(which zsh)
sudo usermod -s /usr/bin/zsh $(whoami) # an alternative way to change user's shell
# the next time we open the terminal, we will be prompted to create the .zshrc file with option "0"

# sh: The shell is a command that reads lines from either a file or the terminal, interprets them, and generally executes other commands
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" # this will install the ohmyzsh framework
# it wil asks us if we want to set zsh as our default shell

# we can install the "powerlevel10k" theme to our terminal by cloning its repository
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# and then we have to set the ZSH_THEME variable in our .zshrc file to the new theme
ZSH_THEME="powerlevel10k/powerlevel10k" # remember we can just comment the line with the old variable with an "#" and paste this new line if we don't want to delete the previous theme
# It's recommended to download and install these four fonts. We can install them in the command line by pasting the file to the right directory or with the GUI app "gnome-fonts-viewer"
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
# next we acces the settings in our terminal emulator and change the font to "MesloLGS"
# now we have to refresh our shell
zsh # It will begin the powerlevel10k configuration wizard

# If we want to configure the powerlevel10 theme again, we can use this command
p10k configure

# to change shell temporarily
exec bash
exec zsh

# to remove the installed packages if anything goes wrong
sudo apt-get remove --purge program_name

# to customize the prompt in the .bashrc
PS1="\[\e[1;32m\]\u@\h:\[\e[1;34m\]\w \[\e[1;35m\]\$(gitbranch)\[\e[0;00m\]\$\[\e[0;00m\]"

# https://blog.desdelinux.net/dale-estilo-al-prompt-de-tu-terminal-con-estas-4-variantes/

# https://ohmybash.nntoan.com/

# https://www.youtube.com/watch?v=mCbVko9pmEQ

# https://linuxconfig.org/how-to-install-and-manage-fonts-on-linux

# https://gnunn1.github.io/tilix-web/

# https://iterm2.com/

# https://www.byobu.org/

# https://www.edevars.com/blog/personalizar-terminal

# https://platzi.com/blog/terminal-en-big-sur-mas-bonita-que-nunca/

# https://platzi.com/blog/como-personalizar-tu-terminal/

# https://platzi.com/tutoriales/1748-terminal/8505-configurando-wsl2-windows-terminal-y-oh-my-zsh/

# https://dev.to/shettykaran21/customize-windows-terminal-with-wsl2-od9

# https://www.youtube.com/watch?v=235G6X5EAvM

# https://draculatheme.com/

# https://ugeek.github.io/blog/post/2019-07-23-plugin-zsh-autosuggestions-autocompletado-en-la-terminal.html

# https://github.com/romkatv/powerlevel10k

# https://ohmyz.sh/
