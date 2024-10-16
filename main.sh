# Ctrl+Tab+T This shortcut opens the terminal
# Ctrl+A goes to the begining of the line
# Ctrl+E goes to the end of the line
# Ctrl+u delete everything to the left of the cursor 
# Ctrl+k delete everything to the right of the cursor
# Ctrl+b / Ctrl+left_arrow jump to the left word by word
# Ctrl+f / Ctrl+right_arrow jump to the right word by word
# Ctrl+d exits actual session, it's equivalent to "exit"
# Ctrl+w erase a word from the actual line
# Ctrl+u erase all the line
# Ctrl+r reverse search for a command that matches the introduced pattern

# we can use emoticons inside the terminal emulator
echo 🙂

# the prompt is formed by user@pc_name:currentdirectory$, the $ means we are a normal user, it changes to # when we are the root user
# the paths in Microsoft Windows are case insensitive unlike Unix where it is case sensitive
cd /c/Users
cd /c/users

# fortune: shows your fortune
fortune
# repeat: repeats the command
repeat 5 {echo "hulky"}
# figlet: shows the text in ascii art
figlet "hello"

# cowsay: a cow that says what you type
cowsay "hello"
cowsay -l
cowsay -f calvin

# lolcat: prints the text in rainbow colors
lolcat "hello world"

# man: the manual page of every command in bash
man pwd
man builtins

# or use the --help flag
pwd --help
help cd

# or the info command
info pwd

# whatis: gives a short description of the command
whatis pwd

# the "Up" key: if we press it we can navigate through the last 1000 commands we have entered, these are stored in a file named "history" inside the home directory
# the history of all the commands entered
history
history | grep string_pattern # we can also use Ctrl+R to do a reverse search to the last command that matches the pattern
# "!" repeats the specified command from the history list
!23
!73
!! # repeats the last command
# -c : clear the command history, this only affects the current session's history and won't delete the history stored in other sessions or in persistent history files (like .bash_history for bash).
history -c
# -w: saves the commands you've executed in the current shell session to the history file, typically ~/.bash_history for Bash users.
history -w
# date: shows the date of the system
date

# cal: shows a calendar
cal

# man hier: a brief description of the linux filesystem
man hier

#clear: clears the terminal deleting all lines, we can also use the -x flag or Ctrl+L to just scroll to the last line
clear -x
clear

#reset: resets the terminal
reset

# echo: display some text
echo "hocus pocus"

# eval: evaluate expressions
expr 2 + 2
expr "some_string"

# pwd : (path working directory) writes the full pathname of the current working directory to the standard output.
pwd

# ls : lists files in the current working directory or we can pass a path as an argument
ls
ls /directory
ls ~/directory
ls directory
# list directories only
ls -d
# adding the -l flag show the files as a long list
ls -l
# by default ls -l shows the size in bytes, so we use -h for "human readable version"
ls -lh
# list files recursively from subdirectories
ls -R
# list hidden files. All the files that start with "." are hidden by default
ls -a
# order the items by size
ls -S
ls -lS
ls -lSh
# shows the items in reverse order
ls -r
ls -lr
# dir: is almost the same as "ls" command
dir
vdir

# tree: shows all the files
tree
# we can use the -L flag to pass an argument to how many levels we want to show
tree -L 2
tree -L 1

# file: determines file type
file .
file some_file.txt

# cd : (change directory) we write the name of the directory we want to open, we can use relative path names so we use "." to state we are in the actual directory, ".." to go to the upper directory, "../.." to go up 2 levels, etc. Or absolute path names
cd ..
cd .
cd ../../directory
cd ./the/relative/path
cd /the/absolute/path/of/an/item
# we can use escape characters for names that contain spaces
cd an\ item\ with\ spaces
cd "an item with spaces"
# In linux and mac the names of the files are case sensitive while in microsoft windows are not
path/to/file
Path/To/File
# ~ : this symbol "~" means that we are in our main directory, the one that has our username, we can just type the cd command as a shortcut to go to our main directory
cd
cd ~
# or go to the previous directory
cd -
# Tab shortcut: the terminal can autocomplete the names of our files and directories by presing tab
cd /home/runner/terminal/testing_dire#Tab

# mkdir: creates a directory. It's recommended to use names without spaces for easy file manipulation, we can create many directories at once. we pass the path of the file to be created as argument
mkdir ./testing2_directory
mkdir "dont use spaces"
mkdir directory1 directory2 directory3

# touch: creates a text file by default but we can add any file extension, we can create many files at once. we pass the path of the file to be created as argument. Update the access and modification times of each file to the current time. A file argument that does not exist is created empty, unless -c or -h is supplied
touch ./a_file
touch b_file.txt
touch c_file.py d_file.js e_file.cpp
touch archive{01,02,03}.txt

# cp: copy files and directories, first argument is the path of the file we want to copy and the second argument is the path of the copy, it can be relative or absolute path
cp ./b_file.txt the_copy_of_bfile.txt
cp b_file.txt ./the_copy_of_bfile.txt
cp b_file.txt the/path/to/the_copy_of_bfile.txt

# mv: renames or moves items(works on files and directories). The first argument is the path of the item we want to move, the second argument is the path where we want to move it
mv file_name.txt ..
mv ../directory/file_name.txt .
mv ./file_name.txt ../new/location
mv /the/absolute/path/of/a/file_name.txt /another/absolute/path/
mv {file1.py,file2.py} new_directory
mv *.txt directory/
# if the path is the same location of the item it just renames it
mv file_name.txt new_file_name.txt
mv file_name.txt ./new_file_name.txt
mv ../path/to/file_name.txt ../path/to/new_file_name.txt
# and if the new path includes the new name of the item it will both rename and move it
mv ./file_name.txt ../new/location/new_file_name.txt

# rm: removes files
rm /the/absolute/path/of/a/file_name.txt
rm file1 file2
# with the -i flag we make it interactive so it asks us to remove each of the items that we pass to the command, we have to type "y" to accept
rm -i /the/absolute/path/of/a/file_name.txt
# To delete everything inside a directory
rm /path/to/dir/*
# see what is being done when deleting by passing the -v option for verbose
rm -v /path/to/directory/*
# we can use "rm -d" or "rmdir" to erase empty directories. it helps you ensure that the directory is empty before deleting it.
rm -d directory
rmdir directory
# To erase non empty directories and remove all sub-directories and files, we can also use r flag for removing recursively
rm -r /path/to/dir
rm -ri /path/to/dir
rm -r dir1 dir2 dir3
# the "f" flag forces the erase of everything but we have to be carefull to not erase system files or other important files. If you want to remove files without any prompts (like when the file is write protected i.e. you don’t have write permission to the file), you’ll be asked to confirm the deletion of the write-protected file, to avoid this we use the -f flag
rm -rf directory
rm -f file.txt

# unlink: The unlink command is used for removing files and links but cannot delete a directory. You can use it to delete both soft and hard links. It can only remove one file at a time. You cannot give more than one files to it at once. You cannot use wildcard(*,?[a-0]) patterns as well. The rm command performs a security check. If you don't have write permission on a file, it will ask you to confirm it interactively or use the force option -f. With unlink, there is no safety checks. It will delete the write-protected file. Imagine that you want to 'force remove' a file irrespective of the write protection, but you want the script to fail if the file doesn't exist. The rm -f won't show any errors if the file doesn't exist but unlink will throw an error.
unlink file.txt

# if we want a more secure approach to erase sensitive data we can use the "shred" command instead
shred

# sort: sort lines of text files
sort file1.txt file2.txt

# shows the first 10 lines of a text file by default, we can modify the number of lines with the -n flag
head file.txt
head file.txt -n 18
head -4 file.txt

# shows the last 10 lines of a text file by default, we can use the -n flag to modify this
tail file.txt
tail file.txt -n 18
tail -1 file.txt

# cat: concatenate one or more files and print on the standard output
cat a_file.txt
cat a_file.txt b_file.txt
# if we don't pass any file to cat, it reads standard input, to stop the input of a command use Ctrl+D
cat
cat > file.txt

# less: we enter an interactive mode where we can use the up, down keys, space bar, b, to move through the file. "g" and "G" to go to the start and end of the file. In this mode we can type "/" followed by a word to search for it. By pressing "q" we quit this interactive mode, 
less file.txt

# xdg-open: opens a file, directory or URL in the user's preferred application.
# using "." opens the current directory in the default file manager
xdg-open .
xdg-open file.py

# nautilus: is the default file manager for gnome desktop environment
nautilus
nautilus directory
nautilus file.py
nautilus .

# type: shows the type of a given command, a command can be 1 of 4 types.
# 1-executable program: a compiled program made with a programing language and usually the executable files are stored in /usr/bin
type nautilus
type python3
type firefox
# 2-shell builtin commands: they're implemented internally by the shell itself, rather than by an executable program somewhere in the file system. 
type cd
type echo
type pwd
# 3-shell function: Shell commands that are external to the ones implemented by the shell
type mkdir
type cat
type less
# 4-Aliases: allow a string to be substituted for a word when it is used as the first word of a simple command. The shell maintains a list of aliases that may be set and unset with the alias and unalias builtin commands
type ls

# a list with all the permanent aliases
alias

# to make a temporary alias until we close the terminal
alias applepie="echo delicious pie"
alias megapower="pwd"
applepie
megapower

# unalias: removes temporary aliases
unalias applepie
unalias megapower
unalias -a

# the permanent aliases can be add to ~/.bashrc or create a dedicated file named ~/.bash_aliases
~/.bashrc
~/.bash_aliases

# this saves the changes to the .bashrc file or alternatively you can close the terminal and open a new one
source ~/.bashrc
source ~/.bash_aliases

# wildcards: special characters that enable us to do advance search and find patterns
# wildcard * : any number of strings
ls *.txt # search for all files that end with ".txt" [any strings].txt
ls data* # search for all files that start with "data" data[any strings]
mv f*es # seach for all files that start with "f" and end with "es"
mv * another/directory # move all the files from the given directory
# wildcard ? : a specific number of strings
ls data? # all the files that have 1 character after "data"
ls data?? # all the files that have 2 characters after "data"
ls data??.csv # all the files that start with "data" followed by 2 characters and end with ".csv" e.g. data[01].csv data[02].csv
# wildcard [[:class:]] : files that match with the character class
ls -d [[:lower:]]* # directories that start with lowercase followed by any number of characters
ls -d [[:upper:]]* # directories that start with uppercase followed by any number of characters
ls file[[:digit:]] # files that start with "file" followed by a number 
ls file[[:alpha:]] # files that start with "file" followed by a letter
ls file[[:alnum:]] # files that start with "file" followed by alphanumeric character
ls *[[:digit:]] # files that end with a number
ls archive[[:digit:]][[:digit:]].txt # archive01.txt archive02.txt
# wildcard [] : files that contain any character inside the square brackets
ls [af]* # files that star with either "a" or "f" e.g. archive.txt, file.py, amazing,js
ls [af][ri]* # files that start with either "a" or "f" and the next letter is "r" or "i" e.g archive.txt, file.py, air.html, frog.cpp
ls [!af]* # files that don't contain any character inside the square brackets
ls [0-9][a-z][A-Z] # files that contain a character between the range inside square brackets 

# the wildcards can be used with many more commands
mv [!af]* /to/directory
rm ??st*
cp [clst][io]?t*
rm *tar*
rm -r file[3-6]*
ls users-[0-9][a-z0-9A-Z][0-9]*

# in linux each process is initialized with 3 streams: stdin, stdout and stderr
# stdin: standard input is usually what we pass to the command, by default is binded to the keyboard input but it can be set to other sources like the content of a file,etc. Its file descriptor is 0
# stdout: standard output is what the shell returns after successfully processing the command, by default is binded to the terminal screen but it can be set to other processes or files. Its file descriptor is 1
# stderr: standard error when the command can't be processed correctly, by default is binded to the terminal screen but it can be set to other processes or files. Its file descriptor is 2

# redirecting operators: we use them to control the flow of the stdin, stdout and stderr
# > operator: redirects the stdout to whatever file we want, if the destination file doesn't exist it will be created. It overwrites the content of the file
ls ./directory > file.txt
ls ./directory 1> file.txt
# we can create an empty file just by redirecting the stdout
> file.txt
# >> operator: appends the stdout to the end of the file
ls ./directory >> file.txt
# to redirect the stderr we must specify its file descriptor
ls ./notexistentdir 2> file.txt
# to redirect both the stdout and stderr whichever the result of the operation is
ls ./notexistentdir > file.txt 2>&1
ls /realdir > file.txt 2>&1
ls ./notexistentdir 2> file.txt 1>&2
ls /realdir /notexistentdir >& file01.txt
ls /realdir /notexistentdir &> file01.txt
# we can redirect stdin and stdout to different files
ls /realdir /notexistentdir 1>> file01.txt 2>> file02.txt
# < operator: redirects the stdin of a command to a file
sort < file.txt
python3 file.py < file.txt
cat < file.txt
tail < file.txt

# << operator: HERE DOCUMENT or HereDoc is when a text block can be redirected to a command or file in an interactive way. the here document works by setting a string delimiter that end the text block that we want to redirect
wc << trunks
piccolo
gohan
goku
trunks

cat << fungi >> file.txt
protozoae
metadae
animale
fungi
# HERE STRING: we redirect a string as an argument to the command.this argument can be a shell variable that can be expanded. HERE STRING is a sting of posible arguments and variables.
sed 's/hola/adios/' <<< "hola mundo"
bc <<< 5*5+2-10

# | operator: it lets us redirect the stdout of a command to the stdin of another command
ls -l | less
echo "hello there" | lolcat
cowsay "hamburguer" | lolcat
cowsay "hamburguer" | lolcat | tee file.txt
cowsay -f dragon-and-cow "Like si te quedaste jugando con lolcat un rato" | lolcat -F 12 -d 5 -a
figlet "zack" | cowsay -f '/usr/share/cowsay/cows/tux.cow' -n | lolcat

# tee: read from standard input and write to standard output and files
ls | tee a_file.txt b_file.txt 
ls | tee file.txt | less
cat a_file.txt | sort | tee b_file.txt | less
ls -l directory | sort | tee file.txt | less

# control operators: let us execute more than one command at a time and concatenate them
# ";" operator: executes 2 or more commands in a synchronous way, one after each other
ls; mkdir directory; echo "hello at last"
ls; echo "look at this"; cat file.txt
eho "look"; echo "at"; eco "this"; echo "mate"
# & operator: executes 2 or more commands in an asynchronous way, meaning that a new shell will be running for each command in the background in a different thread of the cpu, thus executing those commands in parallel. If you know that the command or process is going to take a long time, it would be a better idea to start the command in the background itself. To run a Linux command in the background, all you have to do is to add an ampersand (&) at the end of the command. When the command finishes in the background, you should see information about that on the terminal.
sleep 10 &
ping -c5 www.tecmint.com &
apt update & apt upgrade &
ls & date & echo "friendly"
cat file1.txt & ls & head file2.py
python3 algoritmo_1.py $(cat datos.txt) & python3 algoritmo_2.py $(cat datos.txt)
# && operator: executes a command only if the previous one is successful, is the equivalent of the "and" logical operator
mkdir newdirectory && cd newdirectory
cd directory2 && ls && echo "good job"
echo "look" && echo "at" && echo "this"
echo "look" && eco "at" && echo "this"
# || operator: It evaluates the two commands from left to right and executes only the first "True" command, is the equivalent of the "or" logical operator
echo "look" || echo "at" || echo "this" || echo "mate"
eco "look" || echo "at" || echo "this" || echo "mate"
# ! operator: executes all except the condition provided, is the equivalent to the "not" logical operator
rm -r !(*.xml) #remove everything in the current directory except xml files

# [ command: to test something (e.g. if some file exists) and to return exit status zero if the test succeeds, non-zero otherwise
[ -d directory ]
[ -e file.txt ]
[ -d existentdir ] || echo "hello"
[ -d notexistentdir ] || echo "hello"

# {} operator: Combine two or more commands, the last command inside the brackets has to end with ";"
[ -d existentdir ] || { echo "Directory does not exist, creating directory now"; echo "mkdir"; } && echo "Directory exists"
[ -d notexistentdir ] || { echo "Directory does not exist, creating directory now"; echo "mkdir"; } && echo "Directory exists"

# () operator: makes it possible to execute commands in precedence order
echo "command1" && ( echo "command2" || echo "command3" ) && echo "command4"
echowrong "command1" && ( echo "command2" || echo "command3" ) && echo "command4"
( echo "command1" && echo "command2" ) || ( echo "command3" && echo "command4" )
( echowrong "command1" && echo "command2" ) || ( echo "command3" && echo "command4" )

#file type, permissions, hard link count, owner, group, size, modification timestamp, file name
"d            rwxr-xr-x        4           root   root  4096        abr 19 17:32        boot"

# file type: the first character indicates the type of file, there are 7 file types in linux/unix systems, with an aditional one in Solaris
# symbolic link file(l): These are linked files to other files. They are either Directory/Regular File. There are two types of link files available in Linux/Unix ie soft and hard link. To create them use ln command
"lrwxrwxrwx   1 root root          7 feb  7 00:14 bin -> usr/bin"
# directory files(d): contains regular files/folders/special files stored on a physical device. And this type of files will be in blue in color with link greater than or equal 2.
"drwxr-xr-x   4 root root       4096 abr 19 17:32 boot"
# regular file(-): Readable file, binary file, Image files, Compressed files, etc. To create them use touch/vi command and redirection operators etc. To create them use mkdir command
"-rw-------   1 root root 2147483648 feb  7 00:10 swapfile"
# Block file(b): These files are hardware files most of them are present in /dev. They manage the information of the data blocks like an usb drive or any external drive. To create them use fdisk command or create virtual partition.
"brw-rw----  1 root     disk      8,   1 may  4 13:03 sda1"
# Character device file(c): Provides a serial stream of input or output.Your terminals are classic example for this type of files. They are present in /dev
"crw--w----  1 paganini tty       4,   2 may  4 13:15 tty2"
# Named pipe file or just a pipe file(p): The other name of pipe is a “named” pipe, which is sometimes called a FIFO. FIFO stands for “First In, First Out” and refers to the property that the order of bytes going in is the same coming out. The “name” of a named pipe is actually a file name within the file system.To create them use mkfifo command.
"prw-rw-r-- 1 paganini paganini   0 may  4 13:15 gnome-session-leader-fifo"
# Socket file(s): is used to pass information between applications for communication purpose
"srw-rw-rw- 1 root root      0 may  4 13:04 cups.sock"
# door file(D): is present in Sun Solaris, A door is a special file for inter-process communication between a client and server
# to find a specific file type in our system
find /dir -type c
find /dir -type l
find /dir -type s
find /dir -type b
find /dir -type p

# A link is a reference to another file. Links give the same file multiple names and allowing them to live in two or more locations simultaneously. There are two types of links, Soft link or symbolic link(This is merely a shortcut to the original file) and Hard link(This points to the memory location of the original file)

# symbolic link: also known as a symlink or a soft link, is a special type of file that simply points to another file or directory just like shortcuts in Windows. Creating symbolic link is like creating alias to an actual file. If you try to access the symbolic link, you actually access the target file to which the symlink points to. Changes performed on the content of the link file change the content of the actual target file. In most Linux distributions, the links are displayed in a different color than the rest of the entries so that you can distinguish the links from the regular files and directories.
ln -s target_file link_name
ln -s target_dir link_name
#You can overwrite an existing link. By default, if you try to use an existing link to point to a new file, it will throw you an error, The ln command has two options for this purpose "-i" and "-f". Mind to add the "s" for soft link otherwise you'll convert the soft link to hard link.
"ln: failed to create symbolic link 'existing_link_name': File exists"
# -i: The interactive mode asks you if you want to overwrite the existing link.
ln -si new_file existing_soft_link
# -f: The force mode just updates the existing link without any confirmation.
ln -sf new_file existing_soft_link
# Deleting the link won't delete the source file it links to
rm sym_link
rm sym_link1 sym_link2
# Never force remove a link to a directory with rm -f because it will delete the contents of the directory.
rm -f symlink
# you can follow a symbolic link to get to the original file and use it to remove the file.
rm "$(readlink '/path/to/link')" /path/to/link 
# Don't use trailing slashes with the link else it will complain.
"rm link_to_dir/"
# If you delete a file, keeping the soft link intact, the link becomes a broken or dangling link, keeping such links may not be a good idea. To find all the dangling links in the current directory and its subdirectories we use the find command
find dir -xtype l
# You can create links to non-existent file or directory, You won’t get any error or warning for creating link to a file/directory that does not exist. When you create a soft link, you create a new file. In its metadata, it points to the target. For every soft link you create, you use one inode. A soft link can be created across the different file systems.
# The symlinks are always created with 777 permission (rwxrwxrwx). For regular file, this would mean that anyone can access the file. But that’s not the case for the links, because the permission on the target files matter, not the permission on links. You may use the chmod command to change the permission on the link but it will change the permission of the linked file, not the link itself.

# You can make a symbolic link that points to another link and so on. This is called chained symbolic link. It’s better to avoid them as it creates more confusion. but we can use these methods to find the real file
realpath symlink
readlink symlink
readlink -f symlink
file symlink
stat -c%N symlink

# realpath: we use it to know which real file the link actually points to. Print  the resolved absolute file name; all but the last component must exist. An alternative command is "readlink"
realpath sym_link
realpath directory
realpath file.txt

# hard link: A hard link to a file points to the inode of the file instead of pointing to the file itself. It is a manually created entry in a directory that points to an already existing inode. This way the hard link gets all the attributes of the original file and points to the same data block as the original file. A hard link does not create a new file. It only provides a new name for the same data. It is almost indistinguishable from the original file. You can only notice it with the inode number.
# The link count is the number of directory entries that point to an inode, all the files have link count 1, if a file has link count more than 1, it means there are hard links to this file.
# ln: creates a hard link, the link looks like a regular file and its attributes are the same as the target file.
ln file.txt link_name
# You can create a soft link to a directory but when you try to create a hard link to a directory, you’ll see an error, using hard links for directory may break the filesystem. Theoretically, you can create hard link to directories using -d or -F option. But most Linux distributions won’t allow that even if you are root user.

# Both the file and the hard link will have the same inode number
"134195 -rw-r--r-- 2 abhishek abhishek        0 Jul 17 19:49  file.txt"
"134195 -rw-r--r-- 2 abhishek abhishek        0 Jul 17 19:49  link_name"
# One way to find all the hard links of a file is using its inode number. You can use the ls -i command or the stat command to get the inode number. Once you have the inode number, you can see all the links associated with it using the find command.
find path/to/dir -inum inode_number
# The way inodes work is also why it is impossible to create a hard link across the different file systems. Allowing such a task would open the possibility of having conflicting inode numbers.
# Deleting a hard link is the same as deleting a file.
rm hard_link
# Because a hard link has the same inode number as the original file, you can delete the original file and the data is still available through the hard link. All you did, in this case, is remove one of the names pointing to this inode number. The data linked to this inode number will remain available until all names associated with it are deleted.

# Inode: A Linux filesystem has two main components, a pool of data blocks where data is stored and a database system to manage this data pool. The inode is like index to this database system. It stores metadata(Size, Permission, Owner/Group, Location of the hard drive, Date/time, Other information) for every file on your system in a table-like structure usually located near the beginning of a partition. Inodes numbers are unique at the partition level, you can have two files with the same inode number given they are on different partitions. Every partition has its own inode table. The amount of inodes each file system has is decided when you create the filesystem. For most users, the default number of inodes is more than sufficient.The default setting when creating a filesystem will create 1 inode per 2K bytes of space. This gives plenty of inodes for most systems. You will more than likely run out of space before you run out of inodes. If need be, you can specify how many inodes to create when creating a file system. If you run out of inodes, you cannot create new files even if you have space left on the given partition, every used inode refers to 1 file. Every file has 1 inode. Directories, character files, and block devices are all files. They each have 1 inode.
# Inodes store all the information except the file name and the data. When a new file is created, it is assigned an inode number and a file name, every file in a given directory is an entry with the filename and inode number. All other information about the file is retrieved from the inode table by referencing the inode number.
# check inode numbers
ls -i
# Inodes are also a big reason why a Linux system can update without the need to reboot. This is because one process can use a library file while another process replaces that file with a new version. Therefore, creating a new inode for the new file. The already running process will keep using the old file while every new call to it will result in using the new version.
# An interesting feature that comes with inodes is the ability to store the data in the inode itself. This is called Inlining. This storing method has the advantage of saving space because no data block will be needed. It also increases the lookup time by avoiding more disk access to get the data. Some file system like ext4 has an option called inline_data. When enabled, it allows the operating system to store data this way. Due to size limitations, inlining only works for very small files. Ext2 and later will often store soft link information this way. That is if the size is no more than 60 Bytes.

# user types: after the character that indicates the file type there are 3 user types
# 1-"owner"(by default is the one that creates the file)
# 2-"group"(only one group can be the owner of the file at a time) A single user may be the member of several groups but only the primary group(the primary group of a user can be found using "id" command) of the user is the group owner of a file created by the user. Two groups cannot own the same file.
# 3-"others"(anyone who is neither the owner or part of a group)

# In Linux, the precedence takes from user and then group and then to others, in this case if the owner tries to read the file using cat or less command, he won't be able to because it doesn’t have the read permission. Linux system checks who initiated the process (cat or less in our example). If the user who initiated the process is also the user owner of the file, the user permission bits are set. If the owner of the file didn’t initiate the process, then the Linux system checks the group. If the user who initiated the process is in the same group as the owner group of the file, group permissions bit are set. If this process owner is not even in the group as the file’s group owner, then the "others" permission bits are set.
"----r--rw-"

# Read permission: for files it allows to open, read and copy file content. For directory it allows to list the content of the directory, if the execution(x) permission is also activated we can copy the files from the directory to other locations.
# Write permission: for files it allows to modify the file content but we can't copy, remove it or edit its name. For directory it allows the files inside the directory to be created, added, removed, renamed only if the execution(x) permission is also activated
# Execute permission: for files it allows the file to be treated as a program and executed. For directories it allows to enter the directory

# Each user type has 3 permission types, read(r), write(w) and execute(x)
"-rw-------"
# We can represent these permission types with 1 (ON) or 0 (OFF)
"-110000000"
"-110 000 000"
# as a result, we can also represent each of these 3 bits as a binary number and convert it to its decimal counterpart, this is what we know as "octal mode" or "absolute mode"
"- 6   0   0"

"lrwxrwxrwx"
"l111111111"
"l111 111 111"
"l 7   7   7"

"octal   binary   permission"
"  0      000         --- "
"  1      001         --x "
"  2      010         -w- "
"  3      011         -wx "
"  4      100         r-- "
"  5      101         r-x "
"  6      110         rw- "
"  7      111         rwx "
# symmbolic mode
# u : modify user permissions
# g : modify group permissions
# o : modify others permissions
# a : modify all permissions
# + : adding permissions
# – : removing permissions
# = : overriding existing permissions with new value

# chmod: change file permissions, permissions used to be called mode of access and hence chmod was the short form of change the mode of access.
chmod 755 file.txt
chmod a=r file.txt
chmod g+x file.txt
chmod u-wx file.txt
chmod o-rw+x,ug=x file.txt
# if we omit the user type, it defaults to "a" for all
chmod +x file.txt

# output a diagnostic for every file processed
chmod -v u-wx file.txt file2.txt
# like verbose but report only when a change is made
chmod -c u-wx file.txt
# use FILE’s mode instead of MODE values
chmod --reference=file1.txt file2.txt
# change permissions recursively
chmod -R u-wx directory

# chown: change the owner of a file, also we can change the group, you can use Uid(user id) and Gid(group id) instead of user name and group name respectively.
chown new_user_name file.txt
chown Uid file.txt
chown :new_user_group file.txt
chown :Gid file.txt
chown new_user_name:new_user_group file.txt
# if you want to change the group ownership of a file to the default group of a user, you should just leave the group name after colon
chown new_user: file.txt
# To change the ownership of a directory along with all the content inside the directory, you can use the recursive option -R.
chown -R user_name:group_name directory
# You can use a file as reference and change the user and group ownership of a file based on the reference file
chown --reference=file1.txt file2.txt

# chgrp: change the group of a file
chgrp new_user_group file.txt

# stat: You can get file permissions, size, mtime, ctime, atime, ownership and several other file attributes, It can also display information on the filesystem, instead of the files.
stat file.txt file2.txt
stat directory
stat -f file.txt

# id : print real and effective user and group IDs. Leave the username blank if you are trying to find your own primary group.
id
id user_name
id -ng user_name

# groups: print the groups a user is in
groups
# to see all the groups in the system
cat /etc/group

# whoami: returns the current user
whoami
# to see all the users in the system
cat /etc/passwd


# su: switch user command, when called with no user specified, su defaults to running an interactive shell as root, su switches to the root user completely, exposing the entire system to potential accidental modification. it requires the password of the target account. it is mostly used for switching from one user to another. It does this by starting a login shell in the current directory and environment (su) or by completely changing to the setting of the target user (su -) .
su
su -
su root
su - root
su user_name
su - user_name
# Additionally, su can mimic sudo functionality using the -c option to execute a single command as another user without starting an interactive session.
su -c ls root
su -c whoami user_name

# sudo: it requires the password of the current user, it is advisable to stick to sudo when performing tasks that require root privileges. By doing so, the current user is only granted privileged for the specified command and for a limited-time, users gain sudo access by being added to the sudo group.
sudo command
# it can also be used to switch to the root user and acquire the root environment
sudo -i
exit # we can exit the root session like we do normally with our own user
sudo su

# To run a command as administrator (user "root"), use "sudo <command>". In ubuntu by default, the password for the user "root" (the system administrator) is locked. Once we authenticate ourselves with sudo it will remember that and we don't have to type sudo again until the session ends
sudo apt install program
man sudo_root

# passwd: changes passwords for user accounts. A normal user may only change the password for their own account, while the superuser may change the password for any account.  passwd also changes the account or associated password validity period.
passwd

# the use of 777 is not recommended for security concerns, instead for files the standard is 644 and for directories 755 and we just change the owner or group of the project's files so it can run properly.
# Root user has super powers and normally, it has read, write and execute permissions to all the files

# executing commands inside commands, using $() syntax
cat $(find ~ -name file.txt)
sudo chown $(sudo whoami):$(sudo whoami) cooltest.txt
chown $(whoami):$(whoami) file.txt

# environment variables: Your Linux shell has access to an environment that stores configuration values and other information in environment variables, these variables are name-value pairs used by a system’s shell to define default shell properties. Some of these include your shell’s home directory, prompt, and current working directory Accessing these variables can be useful when working with shell commands. You can also set environment variables that can be accessed and used by your scripts, and applications. Environment variables are inherited by sub-shells, and are available to applications, and daemons. An environment variable in Linux can have global or local scope.

# Globally scoped environment variables: are accessible from anywhere in a particular environment bound by the terminal.
# Locally scoped environment variables: can only be accessed by the terminal that defined the variable. It cannot be accessed by any program or script.

# Standard UNIX variables are classified into two categories, environment variables and shell variables.
# Environment variables: An environment variable is available and valid system-wide, they can be used by scripts and applications, these variables are inherited by all spawned child processes and shells. By convention, environment variables are given upper case names.
# Shell variables: they are available only in the current shell session and are useful when you need to store values temporarily. Each shell such as zsh and bash, has its own set of internal shell variables.

# printenv: view a list of all (global) environment variables available to the current user or each one individually, we can also use the echo command
printenv
echo $HOME
printenv HOME # The path to the current user’s home directory.
printenv USER # The currently logged-in user name.
printenv SHELL # The pathname of the current user’s shell.
printenv PATH # A list of directories that the shell searches for executable files.
printenv PWD # The path to your current working directory
printenv UID # The current user’s unique identifier.

# env: run a program in a modified environment, if no command, print the resulting environment.
env

# set: Change the value of shell attributes and positional parameters, or display the names and values of shell variables, to get a more comprehensive list of (global and local) environment variables, use the set command. This list includes environment variables, shell variables, and functions.
set
# To set the value of an existing environment variable type the variable name followed by the value you want to assign, if the environment variable does not already exist, it is created as a shell variable
HOME=path/to/directory
MYOWNVARIABLE="i_like_peach"
# export: You can promote the shell variable to an environment variable by exporting it
export MYOWNVARIABLE
export ANOTHERVARIABLE="cool_variable"
# To assign multiple values to an environment variable use a list. Each value should be separated by a colon
export EXAMPLE_VARIABLE=/path/to/first/location:/path/to/second/location
# You can also append new items to list
export EXAMPLE_VARIABLE=$EXAMPLE_VARIABLE:$HOME/example_directory
export PATH=$PATH:$HOME/example_directory
# unset: removes an environment or shell variable from the session
unset EXAMPLE_VARIABLE

# You can set an environment variable permanently between shell sessions and users.
# to set a persistent environment variable for a single user, edit the user’s ".bashrc" shell configuration file located in their home directory 
nano ~/.bashrc
# and add a line that exports the environment variable that you want to persist using the export command.
export MAYO="McCormick"
# to set a persistent environment variable for all system users, create a new shell script file (.sh) in the "/etc/profile.d" directory. You can also add environment variables to the "/etc/profile" or the "/etc/bashrc" files. However, your variables may not persist after upgrades to your shell package.
nano /etc/profile.d/mybeautifulfile.sh
# and add a line to your example file that exports the environment variable that you want to persist across all system users
export EXAMPLE_VARIABLE='example value'

# In application development, you can use environment variables to distinguish between application environments(like test and production) and to store configuration information(URLs for each environment’s corresponding API) required by your app
# Create a .sh file to store your app’s configuration values as environment variables. You can store the file in the "/etc/profile.d/" directory to make the configurations available to all system users. The APP_ENV variable can then act as a switch in your application code.
nano /etc/profile.d/app_config_vars.sh
export APP_ENV="TEST"
export APP_TEST_API="https://api.test.example.com/v1/customers"
export APP_PROD_API="https://api.example.com/v1/customers"
# Ensure you reload your system’s profile file to give your terminal session access to your new environment variables, we can use the bash command too
source /etc/profile
bash
# Create a new python file, the python application reads the APP_ENV variable and fetches the configurations from the appropriate variables. This method makes the application environment agnostic — the application responds appropriately depending on its current environment
nano app.py
"import os
app_environ = "APP_" + os.environ["APP_ENV"]
app_api = os.environ[app_environ + "_API"]

print('Your current environment: ' + os.environ['APP_ENV'])
print('Your environment's API URL' + app_api)"
# Execute the file to view which environment and API URL is currently detected by the example application
python3 app.py
# When you need to change to the production environment, update the APP_ENV variable to PROD
APP_ENV="PROD"
# Rerun the main,py file and your output should now indicate that you are using the configurations for your production environment.
python3 app.py

# wc: word count command, prints newline, word, and byte counts for each file, and a total line if more than one file is specified, it can also print the total for characters and maximun line lenght
wc file.txt
wc -m file.txt
wc -L file.txt

# find: searching for files and directories, if you run "find" command without any options and arguments, It will just dump all the files and directories in the current directory and its sub-directories.
find
# it allows you to specify the search term. If you want to find a file by its file name or with name matching a pattern
find file_name.txt
find file?.txt
find *.txt
# By default, the search is recursive and starts from our current location but we can specify the absolute or relative path of a directory location from where we want to start our search. 
find /absolute/path/to/dir file_name
find ../dir file_name
# we can specify the type of search, be it by name, by type, by modified time, etc.
# The option -type f asks it to look for files only and -type d for directories
find -type f
find -type d
find path/to/dir -type d
find directory -type f,d # we can use more than one -type option
# You can search for files and directories by its name
find -name file_name
find -type f -name file_name
find path/to/dir -type f -name file_name
find -name "*.txt" > file.txt && echo coolfiles saved
# By default, the find command is case sensitive. You can run a case-insensitive search with the given name by using -iname instead of -name
find -iname FILE_Name
# One of the most common use of the find command is to find files of a specific type or specific extension. Always put your search expression inside quotes if you use wildcards
find path/to/dir -type f -name "*.cpp"
# because if you don't do that, the shell will expand the wildcard.Your shell will expand *.cpp and replace it with all the files in the current directory whose names end with .cpp This could work if there is only one file but if there are more than one, your shell will complain of incorrect syntax
find path/to/dir -type f -name *.cpp
find path/to/dir -type f -name *.txt
# In the above example, there is only one cpp file and hence when the command expands to
find . -type f -name FILE1.cpp # it works because FILE1.cpp still works as search term.
# But there are two ".txt" files in the same directory and hence the command expands to
find . -type f -name file1.txt file2.txt # it complains because there is more than one search term now.
"find: paths must precede expression: 'file1.cpp'"
"find: possible unquoted pattern after predicate '-name'?"
# Search for multiple files with multiple extensions, the -o option works as logical "OR" condition
find . -type f -name "*.cpp" -o -name "*.txt"
find dir -type f \( -name "*.js" -o -name "*.pdf" \)
find -type f -name "*.txt" -o -name "*.cpp" -o -name "*.pdf"
# Search for files in multiple directories, just specify all the directory paths to search in the find command
find ./directory1 /second/directory2 -type f -name file_name
# look for empty files and directories with the the -empty option
find path/to/dir -empty
find . -empty -type f
find . -empty -type f -name "*.cpp"
# You can find big files or small files based on the search performed by the size parameter. This only works with files, not directories. You use the -size option with + for size greater than "N" and - for size smaller than "N"
# c : bytes
# k: kilobytes
# M: Megabytes
# G: Gigabytes
find path/to/dir -size 50k # Find files of exactly 50 KB in size:
find ./ -size +1G # files bigger than 1 GB in the current directory
find . -size -20c # smaller than 20 bytes
find ./ -size +100M -size -2G # files bigger than 100 MB but smaller than 2 GB in size
find path -size +500M -name "*.log" # all files with name ending in .log and size greater than 500 MB
# mtime: last modification time of file
# ctime: creation time of the file
# atime: last access time of the file
find . -type f -mtime -3 # all the files modified within 3 days (3*24H)
find ./ -type f -ctime +5 # all the files created at least 5 days (5*24H) ago
find . -type f -atime 1 # all the files accesed exactly 1 day ago
find ./ -type f -mmin -5 # all the files that were modified in the last 5 minutes
find . -type f -cmin +2 # all the files that were created at least 2 minutes ago
find ./ -type f -amin 15 # all the files that were accesed exactly 15 minutes ago
# You can specify upper and lower limits
find . -type f -mmin +20 -mmin -30
find . -type f -mmin +20 -mmin -30 -name "*.java" # all the .java files that have been modified between last 20 to 30 minutes
# The find command allows you to search for files with specific file permission and access mode
find . -perm 777 # all the files access mode 777 in the current directory
find . -perm a=r+w # all files with access of read and write for all (exact match, it won't match if the file has execute permission for all)
find -perm u=rwx,go=rx
find -perm u=r+w+x,go=r+x
# You can also search for files based on ownership
find . -type f -user John # files owned by the user John in the current directory
# You can also combine it with other options like size, time and name
find . -type f -user John -name "*.cpp"
find ./ -type f -user John -size +20M
find . -type f -user John -mtime -2
# By default, the find command searches recursively in all the subdirectories of your current location. If you don't want that, you can specify the depth of your search to 1. This will restrict the search to only the current directory and excludes any subdirectories. Similarly we can set a minimal depth if we want to skip some directory levels
find ./ -maxdepth 1 -type f -name "*.txt"
find ./ -mindepth 3 -type d -name directory_name
# -path: search anything that matches the given path expression
find . -path "./crazy/cucumber/*.txt"
find . -path "./cr*ber/*.txt"
# The metacharacters do not treat "/" or "." specially
find . -path "./cr*ber" # will  print an entry for a directory called ./crazy/cucumber (if one exists).

# if you want to exclude a directory from the search, you can do that by combining path, prune and logical OR. Be careful with the "*" in the path of the directory, -prune after -path and -o after prune. Basically, the prune command asks to not use the value specified by path. Prune is always used with -o to ensure that right side of the terms are evaluated only for directories that were not pruned.
find . -path ./path/to/directory_exclude -prune -o -print # all directories and files except the ones inside "directory_exclude"
find . -path "./directory_exclude/*" -prune -o -name file_name # all files named "file_name" except the ones inside "directory_exclude"
find . -path ./path/to/directory_exclude -prune -o -name "*.txt"
find . -path "./path/to/directory_exclude*" -prune -o -name "*.txt"
# pipe redirection won't work with the output of find command, at least not directly, we must use alternatives like the -exec flag or xargs command
'find . -type f -name "*.txt" | ls -l'
# The {} is what references the result of the find command. You can imagine it to be like {file 1, file 2, file 3}. The + sign is used to terminate the exec command. The advantage of {} + is that it runs fewer commands as ls -l file1 file2 file3
find . -type f -name "*.txt" -exec ls -l {} + # long list all the .txt files
find . -type f -name "*.txt" -exec mv -t directory {} + # moves all .txt files to directory
find -type f -name "*.txt" -exec echo {} > other/directory/file.txt + && echo files saved
# There is also another convention with exec, Here, ";" is used instead of the + sign. The additional \ before ";" is used to escape the special character ";". This syntax will run a command for each item ls -l file1, ls -l file2 etc
find . -type f -name "*.txt" -exec ls -l {} \;
# But, {} \; has the advantage of using {} more than once in the same -exec statement
find . -type f -name "*.txt" -exec mv {} {}.old \; # adds .old extension to all .txt files
find . -type f -name '*.txt' -exec bash -c 'mv -- "$1" "${1%.txt}.old"' bash {} \; # replaces .txt extension for .old
# You just parse the output of the find command to the xargs command via pipe
find . -type f -name "*.txt" | xargs ls -l
find -type f -name "*.txt" | xargs > another/directory/file.txt && echo files saved
# You search for file name patters with find and then use grep to search for the content inside those files.
find . -type f -name "*.txt" -exec grep -i alice {} + # all the .txt files that contain the word "alice"
find . -type f -name "*.txt" | xargs grep -i alice
find /etc -type f -name "*.conf" | grep client.conf # all the configuration files on your system that end with the '.conf' extension
# -print0: print the full file name on the standard output, followed by a null character (instead of the newline character that -print uses). This allows file names that contain newlines or other types of white space to be correctly interpreted by programs that process the find output.  This option corresponds to the -0 option of xargs.
find . -name "*.txt" -print0
# -depth: Process each directory's contents before the directory itself.
find -depth -type f -name "*.txt"
# deletes all the matching results, we have to be very careful with this option, it's a good practice to test the command with the -depth option first because the -delete action also implies -depth
find -delete -type f -name "*.txt"
# ! operator: True if expr is false.  This character will usually need protection from interpretation by the shell.
find -type f \! -name "*.html"
 # -regex pattern: File  name  matches regular expression pattern.  This is a match on the whole path, not a search
find -regex ".*bar."
find -regex ".*b.*3"
# grep: find patterns in files, g/re/p global (g) regular expression (re), [processor, parser, printer](p) any matching lines. grep is just one tool that uses regex. There are similar capabilities across the range of tools, but meta characters and syntax can vary. This means it's important to know the rules for your particular regex processor.
# Find all occurrences of a string
grep string_pattern ./file.txt
grep string_pattern ./*.txt
grep < ./file.txt string_pattern
ls -l ./directory | grep file_name.txt
cat file.txt | grep "the string i want to search"
grep "Imagine .* something" file.txt
grep "^string_pattern" file.txt
grep "string_pattern$" file.txt
#  -e PATTERNS, --regexp=PATTERNS: Use PATTERNS as the patterns.  If this option is used  multiple  times  or  is  combined  with  the  -f (--file) option, search for all patterns given.  This option can be used to protect a pattern beginning with “-”.
grep -e "regex_pattern" ./file.txt
# -n, --line-number: Prefix each line of output with the 1-based line number within its input file.
grep -n "regex_pattern"     ./file.txt
# Case insensitive search
grep -i string_pattern directory/*.txt
# Find all the non-matching files, this -L option changes the output to display only filenames. So, none of the files contain the string_pattern
grep -L string_pattern directory/*
grep -Li string_pattern directory/*
# the star (*) wildcard will not match hidden files. Neither it will match files (eventually) contained in sub-directories. A solution would be to combine grep with the find command instead of relying on a shell glob pattern
"find ./ -type f -exec grep -iL string_pattern {} \;" # This is not efficient as it will spawn a new grep process for each file
"grep -iL string_pattern $(find ./ -type f)" # This may have issues with filenames containing space-like characters
# the -z flag: Treats input and output data as sequences of lines, each terminated by a zero byte (the ASCII NUL  character)  instead of  a newline.  Like the -Z or --null option, this option can be used with commands like sort -z to process arbitrary file names.
"grep -z string_pattern directory/*.txt"
# Finding patterns into hidden files and recursively into sub-directories
# the -r “recursive” option of grep:  With that option, you give on the command line the root of your search tree (the starting directory) instead of the explicit list of filenames to examine. With the -r option, grep will search all files in the specified directory, including hidden ones, and then it will recursively descend into any sub-directory
grep -r string_pattern path/to/directory/
# Filtering files by their name (using regular expressions): Unless you specify the -F option, grep assumes the search pattern is a regular expression. That means, in addition to plain characters that will match verbatim, you have access to a set of metacharacter to describe more complex patterns
grep -ir string_pattern ./directory | grep "^[^:]*\.js" # in this approach we use grep to find all files containing the string_pattern, then pipe the output of that first command to a second grep instance filtering out non-js source files
# Filtering files by their name using grep: the --include flag searches only files whose base name matches the given glob pattern
grep -ir string_pattern ./directory --include='*.java'
# Using the -w option, it will match only whole words(patterns preceded and followed by a non-word character. A non-word character is either the begin of the line, the end of the line, or any character that is neither a letter, nor a digit, nor an underscore)
grep -irw word_pattern ./directory --include='*.java'
grep -irw --include='*.java' word_pattern ./directory
# If you'd like your results to be highlighted, you could add --color=auto to your command. If this is not already configured by default on your system, you can activate that feature using the GNU --color option
grep -i --color=auto string_pattern ./directory/*
grep --color=auto string_pattern file_name
grep -irw --color=auto --include='*.java' word_pattern ./directory
alias grep="grep --color=auto" # You could also add this to your shell profile as an alias
# Counting matching lines or matching files
grep -ir --include='*.java' string_pattern ./directory | wc -l
# With the -l option you can limit the grep output to the matching files instead of displaying matching lines. So that simple change will tell how many files are matching
grep -l string_pattern ./directory/*
grep -l string_pattern ./directory/* | wc -l
grep -irwl --include='*.java' word_pattern ./directory | wc -l
# -H, --with-filename: Print  the  file  name  for each match.  This is the default when there is more than one file to search. This is a GNU extension.
grep -H string_pattern ./directory/file.txt
# -h, --no-filename: Suppress the prefixing of file names on output.  This is the default when there is  only  one  file  (or only standard input) to search.
grep -ih string_pattern ./directory/*
#  -o, --only-matching: print only the matched (non-empty) parts of a matching line, with each such part on  a  separate  output line.
grep -o string_pattern ./file.txt
# the -c option of grep will count the number of matching lines per examined file (including files with zero matches)
grep -c string_pattern ./directory/*
grep -c --include="*.java" string_pattern ./directory/*
grep -ic --include="*.java" string_pattern ./directory/*
grep -irwc --include='*.java' word_pattern ./directory
# -v, --invert-match: Invert the sense of matching, to select non-matching lines
grep -v string_pattern ./directory/*
grep -vc string_pattern ./directory/*
grep -irwc --include='*.java' word_pattern ./directory | grep -v ':0$' # regex that filters out the files with :0 matches
grep -irwc --include='*.js' word_pattern ./directory | grep -v ':0$' | sort -t: -k2n # This will sort the text by the "numerals" on the "second" column
# Stop  reading  a file after the specified number of matching lines
grep -m 2 string_pattern ./file.txt

# Finding the difference between two matching sets
"grep -irw --include='*.js' nashorn . | wc -l
86" # searched for the word "nashorn"
"grep -ir --include='*.js' nashorn . | wc -l
105" # search in the same file set for all occurrence of the string "nashorn"
grep -ir --include='*.java' nashorn ./directory | grep -ivw nashorn
grep -ir --include='*.java' nashorn ./directory | grep -iw nashorn

# diff: compare files line by line
diff ./file1 ./file2
diff file1 file2 > file_name.diff
diff ./file1 -  # A file name of '-' stands for the standard input.
# -q, --brief: report only when files differ
diff -q file1 file2
diff --brief directory1 directory2  # If two file names are given and both are directories, 'diff' compares corresponding files in both directories, in alphabetical order; this comparison is not recursive unless the '--recursive' ('-r') option is given.
# -s, --report-identical-files: report when two files are the same
diff -s file1 directory1  #  If one file is a directory and the other is not, 'diff' compares the file in the directory whose name is that of the non-directory. The non-directory file must not be '-'.
diff --report-identical-files directory1 file1
# -r, --recursive: recursively compare any subdirectories found
diff --recursive file1 file2
diff -r file1 file2
# --ignore-file-name-case: ignore case when comparing file names
diff --ignore-file-name-case file1 file2
# --no-ignore-file-name-case: consider case when comparing file names
diff --no-ignore-file-name-case file1 file2
# -i, --ignore-case: ignore case differences in file contents
diff -i file1 file2
diff --ignore-case file1 file2
# --from-file=FILE1: compare FILE1 to all operands; FILE1 can be a directory
diff --from-file=reference_file file1 file2 file3
diff file1 file2 file3 --from-file reference_directory
# --to-file=FILE2: compare all operands to FILE2; FILE2 can be a directory
diff file1 --to-file=directory1
# '--' as an argument by itself treats the remaining arguments as file names even if they begin with '-'.
diff -- -file_name1 file_name2
# -u: Use the unified output format, showing three lines of context
diff -u file1 file2
diff -u file1 file2 > file_name.patch
# -U LINES, --unified[=LINES]: Use the unified output format, showing LINES (an integer) lines of context, or three if LINES is not given. For proper operation, 'patch' typically needs at least two lines of context.
diff -U 4 file1 file2
diff -U4 file1 file2
diff --unified=4 file1 file2
diff --unified file1 file2

# patch: Takes a patch file containing a difference listing produced by the diff program and applies those differences to one or more original files, producing patched versions.
patch file_name.txt patch_file.patch  # if there's just one file to be patched it can be specified on the command line.
patch file_name.txt < patch_file.patch
patch < patch_file.diff  # The names of the files to be patched are usually taken from the patch file
# -b or --backup: Make backup files.  That is, when patching a file, rename or copy the original instead of removing it.  See the -V or --version-control option for details about how backup file names are determined.
patch -b < patch_file.patch
patch --backup < patch_file.patch
# --dry-run: Print the results of applying the patches without actually changing any files.
patch --dry-run < patch_file.patch
# --backup-if-mismatch: Back  up a file if the patch does not match the file exactly and if backups are not otherwise requested.  This is the default unless patch is conforming to POSIX.
patch --backup-if-mismatch < patch_file.patch
# --no-backup-if-mismatch: Do not back up a file if the patch does not match the file exactly and if backups are not otherwise requested.  This is the  default if patch is conforming to POSIX.
patch --no-backup-if-mismatch < patch_file.patch
# -d dir or --directory=dir: Change to the directory "dir" immediately, before doing anything else.
patch -d directory_name < patch_file.patch
patch --directory=directory_name < patch_file.patch
patch -d directory1 file_name.txt patch_file.patch
# -i patchfile or --input=patchfile: Read the patch from patchfile.  If patchfile is -, read from standard input, the default.
patch -i patch_file.patch
patch file_name.txt -i patch_file.patch
patch file_name.txt --input=patch_file.patch
# -o outfile or --output=outfile: Send output to "outfile" instead of patching files in place.  Do not use this option if "outfile" is one of the files to be patched. When "outfile" is -, send output to standard output, and send any messages that would usually go to standard output to standard error.
patch -o outfile_name < patch_file.patch
patch --output=outfile_name < patch_file.patch
# --merge or --merge=merge or --merge=diff3: Merge a patch file into the original files similar to "diff3" or "merge". If a conflict is found, patch outputs a warning and brackets the conflict with <<<<<<< and >>>>>>> lines. The optional argument of --merge determines the output format for conflicts: the diff3 format shows the ||||||| section with the original lines from the patch; in the merge format, this section is missing. The merge format is the default. This option implies --forward and does not take the --fuzz=num option into account.
patch --merge file_name patch_file.patch
patch --merge=merge file_name patch_file.patch
patch --merge=diff3 file_name patch_file.patch
# -pnum or --strip=num: Strip the smallest prefix containing "num" leading slashes from each file name found in the patch file. A sequence of one or more adjacent slashes is counted as a single slash. This controls how file names found in the patch file are treated, in case you keep your files in a different directory than the person who sent out the patch. Not specifying -p at all just gives you "blurfl.c" Whatever you end up with is looked for either in the current directory, or the directory specified by the -d option
patch -p0 < patch_file.patch  # gives the entire file name unmodified "/u/howard/src/blurfl/blurfl.c"
patch -p1 < patch_file.patch  # without the leading slash "u/howard/src/blurfl/blurfl.c"
patch -p4 < patch_file.patch  # "blurfl/blurfl.c"
# -r rejectfile or --reject-file=rejectfile: Put rejects into "rejectfile" instead of the default ".rej" file.  When "rejectfile" is -, discard rejects
patch -r file_name < patch_file.patch
patch --reject-file=file_name < patch_file.patch
# -R or --reverse: Assume that this patch was created with the old and new files swapped. Reverses the patch, effectively undoing the changes
patch -R file_name.txt patch_file.patch
patch -R < patch_file.patch
patch --reverse < patch_file.patch
# -B pref or --prefix=pref: Use the "simple" method to determine backup file names (see the -V method or --version-control method option), and append "pref" to a file name when generating its backup file name. For example, with "-B /junk/" the simple backup file name for "src/patch/util.c" is "/junk/src/patch/util.c"
patch -B pref_string < patch_file.patch
patch --prefix=pref_string < patch_file.patch
# -Y pref or --basename-prefix=pref: Use the "simple" method to determine backup file names (see the -V method or --version-control method option), and prefix "pref" to the basename of a file name when generating its backup file name. For example, with "-Y .del/" the simple backup file name for "src/patch/util.c" is "src/patch/.del/util.c"
patch -Y pref_sting < patch_file.patch
patch --basename-prefix=pref_string < patch_file.patch
# -z suffix or --suffix=suffix: Use the "simple" method to determine backup file names (see the -V method or --version-control method option), and use suffix as the suffix. For example, with "-z -" the backup file name for "src/patch/util.c" is "src/patch/util.c-"
patch -z suffix_string < patch_file.patch
patch --suffix=suffix_string < patch_file.patch
# -V method or --version-control=method: Use "method" to determine backup file names. The "method" does not affect whether backup files are made; it affects only the names of any backup files that are made. With "numbered" or "simple" backups, if the backup file name is too long, the backup suffix "~" is used instead; if even appending "~" would make the name too long, then "~" replaces the last character of the file name.
patch -V existing  < patch_file.patch # "existing" or "nil" Make numbered backups of files that already have them, otherwise simple backups. This is the default
patch --version-control=numbered < patch_file.patch  # "numbered" or "t" Make numbered backups. The numbered backup file name for "F" is "F.~N~" where "N" is the version number
patch -V simple < patch_file.patch # "simple" or "never" Make  simple backups. The -B or --prefix, -Y or --basename-prefix, and -z or --suffix options specify the simple backup file name. If none of these options are given, then a simple backup suffix is used; it is the value of the SIMPLE_BACKUP_SUFFIX environment variable if set, and is ".orig" otherwise.

# xargs: reads items from the standard input, delimited by blanks (which can be protected with double or single quotes or a backslash) or newlines, and executes the command  (default is /bin/echo) one or more times with any arguments followed by items read from standard input.  Blank lines on the standard input are ignored. 
xargs

# awk: pattern scanning and processing language, commonly used in csv files or any text with a comma separated value structure
ls -l | awk '{ print $3 $6 }'
ls -l | awk -F "," '{ print $3 $6 }'
ls -l | awk -F " " '{ print $3 $6 }'
# NR: number row, the number of the current row
awk -F '/' 'NR > 1 && $3 > 0 { print $1, $3 * $4 }' file.txt

# tr: Translate, squeeze, and/or delete characters from standard input, writing to standard output.
echo $PATH | tr : \\n
echo $PATH | tr : X

# basename: Print file name with any leading directory components removed.
basename ./file_name
basename -a ./file1.txt ./file2.txt
# If specified, also remove a trailing suffix
basename --suffix=.txt ./file1.txt ./file2.txt
basename -s .txt ./file.txt
basename ./file.txt .txt

# open a file or directory with a given program
nano /home/runner/terminal/testing_directory/a_file.txt

# exit: exits the terminal, we can also do this with Ctrl+D. This actually exists you from the current shell. When you open a terminal in Ubuntu or any other Linux distribution, it runs the default shell. When you exit from this shell, terminal ends as well
exit

# stty: change and print terminal line settings
stty

# date: print or set the system date and time
date

# show who is logged on
who

# w: Show who is logged on and what they are doing.
w

# which: locate the path to a command binary
which pwd

# whereis: locate the binary, source, and manual page files for a command
whereis cat
whereis grep

# apropos: shows all the commands related to the argument
apropos kill
apropos change list user
apropos -a make

# Sed is a stream editor. Is used to perform basic text transformations on an input stream (afile or input from a pipeline).  While in some ways similar to an editor which permits scripted edits (such  as ed),  sed works by making only one pass over the input(s), and is consequently more efficient. But it is sed's ability to filter text in a pipeline which particularly distinguishes it from other types of editors.
# s/ : sustitution
sed "s/original_string/replacement_string/g" file.txt
sed "s/original_string1/replacement_string1/; s/original_string2/replacement_string2/" file.txt
# uniq: Filter adjacent matching lines from INPUT (or standard input), writing to OUTPUT (or standard output). With no options, matching lines are merged to the first occurrence. It does not detect repeated lines unless they are adjacent. You may want to sort the input first, or use 'sort -u' without 'uniq'.
nano file.txt
"line1
line1
line1
line1
line2
line2
line2"
cat file.txt | uniq
# sort: Write sorted concatenation of one or more files to standard output. With no file, or when file is -, read standard input.
nano file.txt
"line1
line1
line1
line1
line2
line2
line2"
sort file.txt
sort file1.txt file2.txt

# dd: convert and copy a file
# this will create a bootable usb stick
dd bs=4M if=/home/gollum23/Downloads/manjaro-kde-21.0.4-210506-linux510.iso of=/dev/sdc status=progress oflag=sync

# dpkg: package manager for Debian. "get-selections" list all the current packages in the system
dpkg --get-selections
dpkg --get-selections | grep package_name

# uname: prints system information
uname -a

# https://unicode.org/emoji/charts/full-emoji-list.html

# https://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples/

# https://unix.stackexchange.com/questions/19654/how-do-i-change-the-extension-of-multiple-files

# https://www.linode.com/docs/guides/how-to-set-linux-environment-variables/

# https://linuxhandbook.com/hard-link/

# https://linuxhandbook.com/symbolic-link-linux/

# https://askubuntu.com/questions/210741/why-are-hard-links-not-allowed-for-directories?ref=linuxhandbook.com

# https://linuxhandbook.com/linux-file-permissions/

# https://www.linux.com/training-tutorials/file-types-linuxunix-explained-detail/

# https://superuser.com/questions/1533900/difference-between-and-or-and-in-bash

# https://www.ehu.eus/ehusfera/hpc/2013/10/24/comando-if-en-linux/#:~:text=El%20condicional%20if%20es%20un,dependiendo%20de%20la%20condici%C3%B3n%20especificada.&text=Aqu%C3%AD%20si%20no%20se%20cumple,se%20ejecutan%20los%20comandos%2D3%20

# https://www.tecmint.com/chaining-operators-in-linux-with-practical-examples/

# https://www.linuxtotal.com.mx/index.php?cont=redireccionamiento-en-linux

# https://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html

# https://stackabuse.com/zsh-vs-bash/

# https://www.hostinger.com/tutorials/linux-commands

# https://www.gnu.org/software/bash/manual/bash.html#Shell-Functions

# https://phoenixnap.com/kb/pwd-linux

# https://www.geeksforgeeks.org/linux-file-hierarchy-structure/

# https://linuxjourney.com/

# https://platzi.com/blog/41-comandos-terminal/

# https://www.geeksforgeeks.org/ls-command-in-linux/

# https://platzi.com/blog/cosas-que-nos-sabias-sobre-el-sistema-de-permisos-de-linux-realmente-es-octal/

# https://platzi.com/blog/administracion-usuarios-servidores-linux/

# https://static.platzi.com/media/public/uploads/command-line-cheat-sheet_93c5cbb9-8acf-423e-a92e-351a461f15ae.pdf

# https://blog.desdelinux.net/mas-de-400-comandos-para-gnulinux-que-deberias-conocer/
