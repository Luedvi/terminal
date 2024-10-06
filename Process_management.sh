# free: displays  the  total amount of free and used physical and swap memory in the system, as well as the buffers and caches used by the kernel
free
# uptime: Tell how long the system has been running.
uptime
uptime -p
# df: report file system disk space usage
df
# du: estimate file space usage
du
du file.txt
# there are some files where information about the cpu and memory are stored
cat /proc/cpuinfo
cat /proc/meminfo
# pidof: find the process ID of a running program.
pidof program_name1 program_name2 program_name3
# pstree: display a tree of processes
pstree
# renice: alter priority of running processes
renice nice_value process_name
# xkill: is a utility for forcing the X server to close connections to clients. This  program is very dangerous, but is useful for aborting programs that have displayed undesired windows on a user's screen.
xkill
# ps: displays running processes on the system. You can get information like process ID (PID) for the processes you or any other user is running on the same Linux system. If you use the ps command without any options in Linux, it will show the running processes in the current shell, by default, ps selects all processes with the same effective user ID (euid=EUID) as the current user and associated with the same terminal as the invoker.
# It displays the process ID (pid=PID), the terminal associated with the process (tname=TTY), "TTY" is the type of terminal user is logged in to. "pts" means pseudo terminal, "TIME" gives you how long the process has been running showing the cumulated CPU time in [DD-]hh:mm:ss format (time=TIME), "CMD" is the command that you run to launch the process or the executable name (ucmd=CMD). Output is unsorted by default.
ps
# by default we log to TTY pts/0. We can open another terminal tab so it will be TTY pts/1. We can change TTY with "Ctrl+Alt+F1" for pts/1 "Ctrl+Alt+F2" for pts/2, etc.

# "ps" accepts several kinds of options: "UNIX" options, which may be grouped and must be preceded by a dash. "BSD" options, which may be grouped and must not be used with a dash and "GNU" long options, which are preceded by two dashes. 
# The use of BSD-style options will add process state (stat=STAT) to the default display and show the command args (args=COMMAND) instead of the executable name. The STAT means "Process State Codes" which we can find a detailed table in the man page of the ps command.
ps U user_name
ps x
ps a
ps H
# The "-" before some options like "x" is optional, but the general Linux convention is to use "-" before options, 
ps x
ps -x
ps u
ps -u
# -U: Select by real user ID (RUID) or name. The real user ID identifies the user who created the process. we use this option to get the information about all the processes run by a certain user
ps -U user_name
ps -U user_name1,user_name2,user_id1
#-u : selects by effective user ID (EUID) or name. This selects the processes for the effective user name or ID we specifiy. The effective user ID describes the user whose file access permissions are used by the process. Identical to "U" and --user.
ps -u user_name
ps -u user_name1,user_name2,user_id
ps -u 1000
ps --user user_name
ps U user_name
# if we use the -u option with no arguments we get the user name, CPU consumption, and memory usage of each process. RSS shows how much memory the process currently has in RAM while VSZ is how much virtual memory the process has in total
ps -u
# a: Lift the BSD-style "only yourself" restriction this option causes "ps" to list all processes with a terminal (tty), or to list all processes when used together with the "x" option
ps a
# -a: Select all processes except both session leaders and processes not associated with a terminal.
ps -a
# x: Lift the BSD-style "must have a tty" restriction and displays all the processes run by you(same EUID as "ps") even if they are not associated with current tty (terminal type) or if they don’t have a controlling terminal (like daemons).
ps x
# But you’ll rarely see "ps" command used with just option "x". It is usually accompanied by option "u" with detailed information about each process.
ps -ux
ps ux
# with "ax" options causes "ps" to list all processes
ps ax
ps -ax
# With the added -aux options, you can see the running processes by all the users on Linux system. The command output is the same as ps -ux but now you have processes from other users as well. Thanks to the -u option, you can identify which process belongs to which user.
ps aux
ps -aux
# -H: Show process hierarchy (forest)
ps -H
# -f: Do full-format listing.  This option can be combined with many other UNIX-style options to add additional columns. It also causes the command arguments to be printed. Gives you additional details for the selected processes
# UID: Shows the user ID of the process owner.
# PID: Indicates the process ID of that process.
# PPID: Gets the parent process ID. This means it will show the process ID of the parent process.
# C: CPU utilization by that process.
# STIME: Time when the process was started.
# TTY: Terminal associated with that process and if it is not associated with a terminal then it will indicate "?" or "-" mark.
# TIME: Tells you for how long that process utilized your CPU.
# CMD: Shows the command that initiated that process.
ps -f
# -F: Extra full format. implies -f
ps -F
# -e: Select all processes. Identical to -A. An alternative to ps -aux to list all the running processes
ps -e
ps -A
ps -ef # The common practice is to combine the options -ef to get the full listing of the commands used to run the processes.
ps -efH # You can also combine the -H option to see all the processes in a threaded view with child processes under their parents
ps -e -H
ps -eH
# H: Show threads as if they were processes.
ps H
ps -ef H
ps -e H
# -G: Select by real group ID (RGID) or name.  This selects the processes for the given real group name or ID. The real group ID identifies the group of the user who created the process. Identical to "--Group"
ps -G group_name
ps -G group_name1,group_name2,group_id1
ps --Group group_name
ps -fG group_name # You can combine with option "f" to get the full listing
ps -f -G group_name
ps -G group_name -f
# -C: This selects all the current processes for the given program name
ps -C program_name
ps -C program_name1,program_name2
ps aux | grep program_name # You can also use grep command to get a similar result
ps -ef | grep process_name
# -p: Select by PID. This selects the processes that match the given process ID number. Identical to p and --pid
ps -p process_id
ps -p process_id1,process_id2
ps process_id
# --forest: display ASCII art process tree
ps -ef --forest
# f: ASCII art process hierarchy (forest)
ps -e f
# w: Wide output. Use this option twice for unlimited width. This avoids the cut of the execution command column  if not enough space is available.
ps -ef w
ps -ef ww
# -w: Wide output. Use this option twice for unlimited width. This avoids the cut of the execution command column  if not enough space is available.
ps -efw
ps -efww
# --sort: Specify sorting order. Choose a multi-letter key from the STANDARD FORMAT SPECIFIERS section. The "+" is optional since default direction is increasing numerical or lexicographic order. Identical to k.
ps -ef --sort=-%mem
ps -ef --sort -%mem,+%cpu
# k: identical to --sort
ps -ef k uid,-ppid,+pid
ps k uid,-ppid,+pid -ef
ps auxk uid,-ppid,+pid
# -o: User-defined format.  format is a single argument in the form of a blank-separated or comma-separated list, which offers a way to specify individual output columns.  The recognized keywords are described in the STANDARD FORMAT SPECIFIERS
ps -eo "%p %y %x %c %r"
# top: display Linux processes, it provides a dynamic real-time view of a running system, It can display system summary information as well as a list of processes or threads currently being managed by the Linux kernel. It reports data about current processes which is refreshed (by default) every 3 seconds. We can type "h" to display the help menu and type any of the options available, When you want to exit, type the letter "q" to quit
top
# User Info, Uptime, and Load Averages: The first piece of information is a timestamp. Next to it you will see the system up time, this refers to how long the computer has been running without interruption. Next we see three values for the load average. These figures are readings over 1 minute, 5 minutes, and 15 minutes, in that respective order. For our purposes load values can be understood as an estimate of the “stress” on your system’s processing power. For example, a load of 1.0 would mean that 100% of your processing power is currently at work.

# Tasks: System processes are also known as tasks. An operating system relies on a number of processes running in the background to make other activities possible, such as using a web browser. Processes can be run in many different ways and are prioritized using a variety of algorithms. This serves to optimize how and when the computer performs the task.
# Running 	Active / in Queue to be Processed
# Sleeping 	Waiting for a Process to Complete
# Stopped 	Interrupted by Job Control Signal (CTRL+C, for example)
# Zombie 	Made up of “Orphaned” Child Tasks / No Longer Running

# CPU information in top command: Each of the values here is a percentage of time spent on the respective tasks. This gives a fairly detailed breakdown of how processing power is being used.
# us 	Processing done in User Mode
# sy 	Processing done in System/Kernel Mode
# ni 	Time Spent on “Nice” Processes
# id 	Time Spent Idle
# wa 	Waiting for a I/O Process to Complete
# hi 	Time Spent Due to Hardware Interrupts
# si 	Time Spent Due to Software Interrupts
# st 	Time “Stolen” by Virtual Machine Resources

# Memory usage in top command: These lines mimic the output of the "free" command in Linux.

# Task Table: You see the table of all the currently running tasks. These are customizable by typing "F" while top is running. This will display a complete list of available options
# PID 	   Process ID (Unique Positive Integer)
# USER 	   User Name
# PR 	   Priority (Kernel)
# NI 	   Nice Value
# VIRT 	   Virtual Memory
# RES 	   Resident Size (Physical Memory)
# SHR 	   Shared Memory
# S 	   Process Status (Running, Stopped, etc.)
# %CPU 	   CPU Load
# %MEM 	   Percentage of RES / Total RAM
# TIME +   Total Time Spent on Process
# COMMAND 	Command That Began Process

# Color and Memory Scale: "Z" modify the output colors, "B" disables bold globally. "b" toggles bold only on tasks section. To modify the memory scale from kilobytes all the way up to exabytes, "E" modifies the figures from the summary section, while "e" adjusts the scale in the task table.

# Toggle Views for Summary Info: 'l' load avg; 't' task/cpu stats; 'm' memory info. Each respective key will adjust the display options. The default is a text based output, but there are also simulated bars or you can turn items off completely.

# View CPU-Specific Info: You can separate into individual nodes with their own statistics. Toggle '0' zeros; '1/2/3' cpus or numa node views; 'I' Irix mode
# solaris mode: On Solaris, the top command always takes all cpu usage as a maximum 100%, no matter how many cpus are there on the board. In a case of 4 processors on a server, any single process listed on top command will not exceed 25% of overall cpu usage. Which means, Solaris takes all the processors as a whole, the total usage of cpu is always from 0% to 100%, regardless how many processors the server has.
# Irix mode: the maximum total cpu usage are the summation of total number of cpu, no more fixed at 1 (100%) as Solaris mode. Hence, a single process can be up to 100% when Irix Mode is on. It's impossible for any single process to utilize more than one processor at the same time.

# Top Field Manipulation: We can add or remove any fields we want displayed, we can also adjust the fixed-width of the text. Similarly, you can also sort the commands output by a specific field (default is CPU). Fields 'f'/'F' add/remove/order/sort; 'X' increase fixed-width. "Shift+M" sort the output by memory (%MEM), "Shift+P" sorts the output by cpu usage (%CPU)

# Locate String: Locate 'L'/'&' find/again; Move sort column: '<'/'>' left/right.
# toggle 'A': Alternate display mode, show Single / Multiple windows

# Organize Your View: Toggle 'R' Sort; 'H' Threads; 'V' Forest view; 'v' hide/show forest view children; 'J' Num justify; 'C' Coordinates. These commands give you options for organizing task information. "Sort" will display all of the tasks by PID, rather than the default sort by activity function. "Threads" will change your detailed and summary view to thread-oriented instead of task-oriented. "Forest view" arranges processes in a ‘tree’ structure to demonstrate parent-child relationships. "Numeric justify" changes the default left-aligned position of numeric fields.

# Toggle Full-Path, Idle Tasks, Cumulative Time, and Text Justification:  Toggle 'c' Cmd name/line; 'i' Idle; 'S' Time; 'j' Str justify. When you toggle "c", you will see the full path of commands. "Idle" removes all non-active tasks from the display. "S" uses cumulative time. "String justify" changes the default left-aligned position of string fields

# Toggle Highlights: Toggle highlights 'x' sort field; 'y' running tasks. "x" Changes highlighting for the current sort field Column. "y" Changes highlighting for "running" tasks rows

# Filter by User or Field/Value: Filter by 'u'/'U' effective/any user; 'o'/'O' other criteria. We can easily filter out specific users or field/values. This is great for a system with many users or a lot of open tasks. We can add as many filters as we need. Filters require a comparison operator between the field and the value (COMMAND=top, TIME+>0:20:00, etc) Using shift for "O" or "o" toggles case-sensitivity.

# Filter number of Processes: Set 'n'/'#' max tasks displayed; Show Ctrl+'O' other filter(s). Using either "n" or "#" will give you the option to enter a numeric value. This will show only the number of processes desired. "Ctrl+o" shows other active filters that we have set with "o" or "O" options

# Renice or Kill Process with PID: Manipulate tasks 'k' kill; 'r' renice. Using these commands, we can change the nice value or kill the process. Using kill by default sends a SIGTERM signal, this allows it to finish executing code before terminating, but we can pass any termination signal in its numeric or symbolic form.
# The priority of a process is often called its nice value. The nice value can range from -20 to 19, with 19 being the lowest priority. For example, if a command normally runs at a priority of 10, specifying an increment of 5 runs the command at a lower priority, 15, and the command runs slower.

# Change the default update time: "d" or "s" Set update interval

# htop: is a more advanced command, similar to "top" but it's not installed by default in linux distros
htop

# kill: send a signal to a process, the default signal for kill is TERM. The kill command is used to eliminate a process. if you don't specify the kill signal while executing the kill command, it will utilize SIGTERM signal to terminate the process
kill process_id
kill process_id1 process_id2 process_id3
kill $(pidof program_name)
# can also be used along with the job id to terminate a job.
kill %1
kill %2 %3
# -l, -L: List all signal names and their corresponding values. This option provides a list of all available signals, along with their numerical values. This option has optional argument, which will convert signal number to signal name, or other way round.
kill -l
kill -l 22
kill -l SIGWINCH
kill -L
kill -L 35
kill -L SIGURG
# you can use the standalone version of the kill signal to list available kill signals
/usr/bin/kill -L
# SIGHUP	1	Hangup signal, used to restart or reload processes.Sent to a process when the terminal controlling it is closed.
# SIGINT	2	Interrupt signal, The signal sent to a process when a user terminates a process. sent when you press Ctrl+C.
# SIGQUIT	3	Quit signal, used to create a core dump of a process. sent when you press Ctrl+\
# SIGILL	4	An illegal instruction signal, sent when a process tries to execute an illegal instruction.
# SIGTERM	15	Termination signal, the default signal sent by the kill command.
# SIGKILL	9	Kill signal, a forceful signal that immediately terminates the process, without allowing it to save its current state.
# SIGSTOP	19	Stop signal, used to pause or suspend a process.
# SIGCONT	18	Continue signal, used to resume a suspended process.
# SIGTSTP	20	Terminal stop signal, sent when you press Ctrl+Z.
# SIGCHLD	17	Child signal, sent to a parent process when a child process terminates or stops.

# -s: Specify the signal to sent by name or number. This option allows you to send a specific signal to the process instead of the default SIGTERM signal.
kill -SIGKILL process_id
kill -KILL process_id
kill -kill process_id
kill -15 process_id
kill -s SIGKILL process_id
kill -s KILL process_id
kill -s sigkill process_id
kill -s kill process_id
kill -s 15 process_id

kill -SIGSTOP process_id
kill -STOP process_id
kill -19 process_id
kill -s SIGSTOP process_id
kill -s STOP process_id
kill -s sigstop process_id
kill -s stop process_id
kill -s 19 process_id
# A PID of "-1" is special, it indicates all processes except the kill process itself and init.
kill -SIGKILL -1 # Kill all processes you can kill.
# Negative PID values  may be  used to choose whole process groups; see the PGID column in ps command output.
kill -SIGSTOP -process_group_id
kill -SIGSTOP -3445
# If signal is 0, then no signal is sent, but error checking is still performed. This can be used to check for the existence of a process ID or process group ID. So signal 0 will not actually in fact send anything to your process's PID, but will check whether you have permissions to do so
kill -0 process_id
# The keybinding of executing SIGTSTP is Ctrl+Z, it suspends any current process running in the terminal, this is for stoping foreground process. 
"sleep 1000"
"Ctrl+Z"
# if you want to stop execution (suspending a running process) for background processes, use the kill command specifying PID or JOB ID with -SIGTSTP
"sleep 1000 &"
kill -SIGTSTP %job_id
kill -SIGTSTP %1
kill -SIGTSTP process_id
kill -20 1441
# to resume a command execution use SIGCONT
kill -SIGCONT %job_id
kill -SIGCONT process_id
# The keybinding of executing SIGINT is Ctrl+C, it interrupts any current process running in the terminal, this is for killing foreground process.
"sleep 1000"
"Ctrl+C"
# to terminate background process using SIGINT
"sleep 1000 &"
kill -SIGINT %job_id
kill -SIGINT process_id
# but the problem with SIGINT is it may not work in some places such as bash interpreters. In this example It gives the current date and time when we press Ctrl+C and only stops when it gets input from the user. You can not rely on SIGINT always.
nano bash_script.sh
"#!/bin/bash
trap date SIGINT
read input
echo User input: $input
echo Exiting now"
./bash_script.sh
# The SIGQUIT is similar to SIGINT but it also generates a core dump before execution. In simple words, the core dump is a file that is generated automatically before the system crashes or the process is terminated. We can use it for terminating foreground and background processes.
"sleep 1000" # It can be provoked by using Ctrl+\ to terminate foreground process
" Ctrl+\ "
# to terminate background process using SIGQUIT
"sleep 1000 &"
kill -SIGQUIT %job_id
kill -SIGQUIT process_id
# SIGTERM, its name is made up of SIGnal and TERMinate. It's a termination signal that terminates the program but unlike SIGKILL (that kills the program no matter what), this is a polite way of asking the program to be terminated. One thing to remember is that sometimes it performs cleanups before proceeding with termination. It can also be referred as a soft kill because the process that receives the SIGTERM signal may choose to ignore it.
kill -SIGTERM %job_id
kill -SIGTERM process_id
kill %job_id
kill process_id
# The SIGKILL is used for immediate termination of a process. This signal cannot be ignored or blocked. The process will be terminated along with its threads (if any). It is always advised to use SIGKILL as a last resort because it will kill any child process immediately, making it the most brutal way of killing processes
kill -SIGKILL %job_id
kill -SIGKILL process_id
kill -9 process_id
# SIGTERM over SIGKILL: SIGTERM gracefully kills the process whereas SIGKILL kills the process immediately. SIGTERM signal can be handled, ignored, and blocked, but SIGKILL cannot be handled or blocked. SIGTERM doesn’t kill the child processes. SIGKILL kills the child processes as well. Unless we have an unresponsive process we should avoid using SIGKILL. With SIGTERM, a process gets the time to send the information to its parent and child processes. Its child processes are handled by init. Use of SIGKILL may lead to the creation of a zombie process because the killed process doesn’t get the chance to tell its parent process that it has received a kill signal.

# killall: If you do not know what the PID of a process is, or if the said process has multiple child processes, and you want to kill the child processes and the parent process at once, you can use killall. It sends a signal to all processes running any of the specified commands. A killall process never kills itself (but may kill other killall processes). Similar to kill command, specifying a termination signal is optional. When no termination signal is specified, killall will send SIGTERM (15) to gracefully shut down said process.
killall program_name1 program_name2
killall -SIGSTOP program_name
killall -STOP program_name
killall -19 program_name
killall -s STOP program_name
# -e, --exact: Require an exact match of the process name. If a command name is longer than 15 characters, the full name may be unavailable (i.e. it is swapped out). In this case, killall will kill everything that matches within the first 15 characters. With -e, such entries are skipped. killall prints a message for each skipped entry if -v is specified in addition to -e.
killall -e program_name
killall --exact program_name
# -l, --list: List all known signal names
killall -l
killall --list
# pkill: It is a combination of "pgrep" and "kill" command, It uses pattern matching to match processes and kills them. pkill will send the specified signal (by default SIGTERM) to each process instead of listing them on stdout.
pkill regex_pattern
# -u, --euid: Only match processes whose effective user ID is listed. Either the numerical or symbolical value may be used.
pkill -u euid1,euid2,euid3
pkill --euid euid
# -x, --exact: Only match processes whose names (or command lines if -f is specified) exactly match the pattern.
pkill -x name_pattern
pkill --exact name_pattern
# -, --signal: Defines the signal to send to each matched process.  Either the numeric or the symbolic  signal  name  can  be  used
pkill -STOP name_pattern
pkill --signal SIGSTOP name_pattern
pkill -CONT -x name_pattern

# sleep: delay for a specific amount of time
sleep 10000

# Jobs, processes, and tasks are words that are often used interchangeably. There are actually some small differences that are important for clarity. The difference can be boiled down to which entity is handling the tasks. Users own jobs, while the kernel owns processes.
# In Linux, a job can be a single process or it may have many childs or sub-processes. An example of this may be a job that features several piped commands like this:
cat file1 | sort | uniq
# In personal computing, the operating system handles most processes automatically. This is usually optimized for the needs of the system or the priority given to a certain task. These processes are completed by the kernel and are given a process ID (PID).
# When you open a new shell and enter any command (or series of commands) into a terminal, you create your own jobs. At the user level –from a shell, you can manually send jobs to work in the background, bring them to the foreground, or suspend them (using Ctrl+z).

# jobs: allows the user to directly interact with processes in the current shell, shows running and recently terminated processes. The job id is inside [] square brackets. The "+" sign indicates the last job you have run or foregrounded. The "–" sign indicates the second last job that you ran or foregrounded. We can restrict the output to a specific job or if we call it without options, the status of all active jobs is displayed. Jobs have three possible states in Linux: foreground, background, and stopped. If there is no output to the jobs command is because there were no active jobs in the shell. We don't need the PID because we can control jobs using the user/shell-specific job ID.
jobs
jobs job_id1, job_id2, job_id3
jobs 3
jobs 1 3 4
# we can also express the job_id by adding a "%" before de number, we will have to use this format if we use "zsh"
jobs %3
jobs %1 %2 %3
jobs %1 2 %3 4
# -l: lists process IDs in addition to the normal information
jobs -l
jobs -l 2
jobs 2 4
# -p: lists process IDs only
jobs -p
jobs -p 1 3
# -n: lists only processes that have changed status since the last notification
jobs -n
jobs -n 3 1 2 4
# -r: restrict output to running jobs
jobs -r
jobs -r 5 7
# -s: restrict output to stopped jobs
jobs -s
jobs -s 1 3
# If -x is supplied, command_name is run after all job specifications that appear in command_args have been replaced with the process ID of that job's process group leader. If -x is used, returns the exit status of command_name.
jobs -x command_name [command_args]

sleep 300 &
echo %1
jobs -x echo %1
# fg: Place the job identified by job_id in the foreground, making it the current job. If job_id is not present, the shell's notion of the current job is used.
fg
fg job_id
fg 5
fg %5
# to send a job to work in the background we can append our command with an & (ampersand) symbol. This command returns the job ID in the brackets. The following number is the process ID used by the kernel
sleep 100 &
# bg: Place the jobs identified by each job_id in the background, as if they had been started with '&'. If job_id is not present, the shell's notion of the current job is used.
bg
bg job_id
bg 2
bg %1 %2 3 4
# If you already ran a program and then realized that you should have run it in the background, you have to use Ctrl+Z to suspend the running process and then use 'bg' to send the process in the background
sleep 1000
"Ctrl+Z"
bg job_id

# disown: kill a process running and keep the program open
nautilus & disown
nautilus directory & disown

# https://tldp.org/LDP/tlk/kernel/processes.html

# https://www.computerhope.com/unix/signals.htm

# https://unix.stackexchange.com/questions/446215/where-is-core-dumped-file-by-handling-sigquit-stored

# https://unix.stackexchange.com/questions/608909/usage-example-of-x-option-of-jobs-command-in-bash
