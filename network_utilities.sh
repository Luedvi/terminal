# ifconfig: shows network information like our ip adress and the name of our bluetooth or wifi devices and their configuration
ifconfig

# show / manipulate routing, network devices, interfaces and tunnels
ip address
# The names of all objects may be written in full or abbreviated form, for example address can be abbreviated as addr or just "a"
ip a

# ping: shows if a web page is available, the command do this in an infinite loop so we have to stop the process manually
ping www.webpage.com
# limits the packages being sent to the ip adress
ping -c 6 www.webpage.com
# specifies the size of the package being sent, the size has to be in bytes
ping -s 20 www.google.com

# curl: gets the information from the console (the html structure) of a specific web page
curl www.google.com
curl www.google.com > index.html

# wget: The non-interactive network downloader, is a free utility for non-interactive download of files from the Web. It supports HTTP, HTTPS, and FTP protocols, as well as retrieval through HTTP proxies. By default it acts like curl but saves the information automatically in a file
wget www.google.com
# we can pass many ip adresses
wget www.google.com www.amazon.com

# traceroute: lists all the nodes that we pass to get to a specifyc ip adress
traceroute www.google.com

# netstat -i: shows all the net devices we have installed in our computer
netstat -i
# dig: DNS lookup utility
dig @server name type
# hostname: show or set the system's host name
hostname
