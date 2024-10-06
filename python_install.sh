# python is preinstalled with almost every linux distro but we can choose a specific version by adding this repository from "deadsnakes" developer
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
# we have to update because we added a new repository
sudo apt update
sudo apt install python3.12
python3 --version
# we can run python in the terminal, The term “REPL” is an acronym for Read, Evaluate, Print and Loop. In Python3 mode, the REPL uses Python to control your computer. This version of the REPL is the most powerful. For example, as you type, the REPL will show you hints for the code you’re using.
# The Python REPL is a powerful interactive tool that offers an immediate feedback loop for Python code, making it indispensable for testing, learning, and debugging. While the default REPL is great for simple tasks, there are enhanced versions available, such as `IPython`, that offer advanced features like auto-completion, syntax highlighting, and magic commands.
python3
num1 = 2
num2 = 5
result = num1+num2
print('el resultado de la suma de {0} y {1} es {2}'.format(num1, num2, result))
exit()
# we can run a http server
python3 -m http.server 8000

# https://codewith.mu/en/tutorials/1.0/repl

# https://realpython.com/python-repl/
