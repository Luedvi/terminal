# we can make a file with an extension like .py .cpp .js .sh or any other programing language an executable file that can be a command
# this files have at the beginning #! followed by the path to the language interpreter
#!/usr/bin/bash
#!/usr/bin/python3.10

cat goku.py
"#!/usr/bin/python3.10
print ('kame hame ha!')"
# if the file has execution permission we can type to the terminal ./file_name, it will read the first line and search for the interpreter to run the code inside the file
./goku.py
"kame hame ha!"
# in linux we don't need file extensions for them to execute, so we can rename it without the extension
mv goku.py goku
./goku
# the command line searches for this programs in a specific directory, usually /usr/bin so when we write something in the terminal it will search if it's inside that directory and if that is the case it will execute the file. So if we move the file without extension there, we would have created a new command. we need sudo to add files to this directory.
sudo mv goku /usr/bin
# finally we just type the command in the terminal
goku

# to see what shell we are using
echo $0
echo $SHELL

# see what shells do we have installed
cat /etc/shells

# changes the default shell
chsh -s /bin/dash

# see the bash info
info bash
