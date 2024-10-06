# update-alternatives: change the default programs in Ubuntu and other Debian based distributions
# --get-selections: List all master alternative names (those controlling a link group) and their status. Each line contains up to 3 fields (separated by one or more spaces). The first field is the alternative name, the second one is the status (either auto or manual), and the last one contains the current choice in the alternative (beware: it's a filename and thus might contain spaces).
update-alternatives --get-selections
# --display: Display information about the link group.  Information displayed includes the group's mode (auto or manual), the master and slave links, which alternative the master link currently points to, what other alternatives are available (and their corresponding slave alternatives), and the highest priority alternative currently installed.
update-alternatives --display alternative_name
# --auto: Switch the link group behind the alternative for alternative_name to automatic mode.  In the process, the master symlink and its slaves are updated to point to the highest priority installed alternatives.
update-alternatives --auto alternative_name
# --config: Show available alternatives for a link group and allow the user to interactively select which one to use. The link group is updated.
update-alternatives --config alternative_name
update-alternatives --config editor
update-alternatives --config vi
# --all: Call --config on all alternatives. It can be usefully combined with --skip-auto to review and configure all alternatives which are not configured in automatic mode. Broken alternatives are also displayed. Thus a simple way to fix all broken alternatives is to call yes '' | update-alternatives --force --all.
update-alternatives --all
update-alternatives --all --skip-auto
# vim: is a text editor like nano or emacs
vim
vim file.txt
# some distributions have different versions of vim like vim tiny, vim-gtk, vim athena, vim nox, etc
vi # this is the command for vim tiny, to use the "vim" command we have to install any of the other versions of vim
vi file.txt
# vimtutor: a quick tutorial for the basics of vim
vimtutor
# some alternatives to ":wq" is just typing ":x" or shift+ZZ
# :split <FILENAME> Open a new file inside vim in horizontal tiling and enter into Split Mode 
# :vsplit <FILENAME> Open a new file inside vim in vertical tiling and enter into Split Mode
# "Ctrl + ww"  Changes between vim window tiles
# :set number - Enable line numbers
# :<LINE_NUMBER> - Go to LINE_NUMBER
# :$ - Go to the last line
# we can use Ctrl+F to move forward and Ctrl+B to move backwards
# in "insert" mode we can copy what we just typed with Ctrl+C and then paste it with "."

# https://www.lunarvim.org/

# https://www.baeldung.com/linux/vim-packages-comparison

# https://linuxhint.com/vim_syntax_highlighting/

# https://github.com/junegunn/vim-plug

# https://spacevim.org/

# https://www.gnu.org/software/emacs/documentation.html

# https://www.vim.org/docs.php

# https://www.nano-editor.org/

# https://neovim.io/
