# List all files in current and sub directories
find
find . 
find . -print

# Search a specific directory or path
# Lists out all files by default
find /etc 

# find a particular file
find ./test -name "abc.txt"

# use wildcards if needed
# all sub directories are searched recursively.
find ./test -name "*.php"

# ignore the case
find ./test -iname "*.Php"

#Limit depth of directory traversal
find ./test -maxdepth 2 -name "*.php"
# Just like maxdepth there is an option called mindepth which does what the name suggests, that is, it will go atleast N level deep before searching for the files

#Invert match
find ./test -not -name "*.php"
find ./test ! -name "*.php"

#Combine multiple search criterias
find ./test -name 'abc*' ! -name '*.php'
find -name '*.php' -o -name '*.txt'

#Search only files or only directories
find ./test -type f -name "abc*"
find ./test -type d -name "abc*"

#Search multiple directories together
find ./test ./dir2 -type f -name "abc*"

#Find hidden files
find ~ -type f -name ".*"

# Find files with certain permissions
find . -type f -perm 0664
find . -type f ! -perm 0777

#Find files with sgid/suid bits set
#The "perm" option of find command accepts the same mode string like chmod.
find / -perm 2644
find / -maxdepth 2 -perm /u=s 2>/dev/null

# Find readonly or executable files
find /etc -maxdepth 1 -perm /u=r
find /bin -maxdepth 2 -perm /a=x

#Find files owned to particular user
find . -user bob

#Search files belonging to group
find /var/www -group developer
# do it in a home directory
find ~ -name "hidden.php"

#Search file and directories based on modification date and time
#Find files modified N days back
find / -mtime 50

#Find all files that were accessed in the last 50 days.
find / -atime 50

#Find all files that were modified between 50 to 100 days ago.
find / -mtime +50 –mtime -100

#Find files changed in last N minutes.
find /home/bob -cmin -60

#find all the files which are modified in last 1 hour.
find / -mmin -60

#find all the files which are accessed in last 1 hour.
find / -amin -60

#Find files of given size
#find all 50MB files
find / -size 50M

#find all the files which are greater than 50MB and less than 100MB
find / -size +50M -size -100M

#Find largest and smallest files
#display the 5 largest file in the current directory and its subdirectory.
find . -type f -exec ls -s {} \; | sort -n -r | head -5
# in descending order
find . -type f -exec ls -s {} \; | sort -n | head -5

#Find empty files and directories
find /tmp -type f -empty
find ~/ -type d -empty

# Run advanced commands on the results of find command
# list out file details
find . -exec ls -ld {} \;

#remove all text files in the tmp directory
find /tmp -type f -name "*.txt" -exec rm -f {} \;

#delete files larger than 100MB
find /home/bob/dir -type f -name *.log -size +10M -exec rm -f {} \;

#The xargs command takes white space characters (tabs, spaces, new lines) as delimiters. You can narrow it down only for the new line characters ('\n') with -d option like this
ls *.mp3 | xargs -d '\n' mplayer
ls *.mp3 | xargs -0 mplayer
# Second option above is the best in conjucntion with find's -print 0
#The xargs utility reads space, tab, newline and end-of-file delimited strings from the standard input and executes utility with the strings as arguments.
#You want to avoid using space as a delimiter. This can be done by changing the delimiter for xargs
find . -name "*.mp3" -print0 | xargs -0 mplayer

