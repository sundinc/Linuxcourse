#!/bin/bash
loremipsum=https://chalmers.se/en/departments/physics/research/cmt/tassin/Documents/loremipsum
#First I define all options in the menusystem.
MENU=("-p" "-u" "-d" "-f" "-h" "-q")
quit(){
	clear
	echo "Are you sure you want to quit? Type yes to kill"
	read REPLY
	if [[ "${REPLY}" == "yes" ]];
	then
		exit 1
	fi
}
trap quit SIGQUIT
trap interrupt SIGINT
#Then I write my perform task function. This is basically the mainprogram that performs different tasks depending on input argument. I only look at the first argument as I only expect 1 argument at all times
function performTask(){
	if [ "$1" == "-p" ];
	then
		echo  "The total number of processes: " 
		ps -A --no-headers | wc -l 		#No headers options as I do not want to count the headers as a process.
	elif [ "$1" == "-u" ];
	then
		awk -F":" '{print "User name: " $1 "\tShell:" $7}' /etc/passwd | less
	elif [ "$1" == "-d" ];
	then
		#Promt for directory
		echo "Enter a directory. If directory not found, /tmp will be used"
		read DIRECTORY
		if [ -d "$DIRECTORY" ];
		then
			echo 
			wget -P $DIRECTORY $loremipsum
		else
			wget -P /tmp $loremipsum
		fi
	elif [ "$1" == "-f" ];
	then
		#Promt for directory
		echo "Enter a directory."
		read DIRECTORY
		if [ -d "$DIRECTORY" ];
		then
			du -lh --block-size=K $DIRECTORY | awk -F "t" '{print "Size: " $1/1024 "mb"}' 
		else
			echo "Directory not found"
		fi	
	elif [ "$1" == "-h" ];
	then
		echo -e "This script is performed by passing one of following argumentsu: \n -p, -u, -d, -f, h or none to open the menu.\n -p prints process information \n -u shows a table of local usersand shell information \n -d downloads the loremipsum file to a specified folder \n -f shows the disk usage of a specified folder \n -h (or a faulty option) displays this help. \nin the menu there is also q to quit."	
	fi
}
#Then If no arguments was promted I promt the user for an option.
#Else if there was arguments, perform the tasks.
main(){
if [ "$#" -eq 0 ];
then
	echo "Select an option in the menu"
	select OPT in "${MENU[@]}"
	do
		echo $OPT
		case $OPT in 
			"-p")
				performTask $OPT 
				;;
			"-u")
				performTask $OPT 
				;;
			"-d")
				performTask $OPT 
				;;
			"-f")
				performTask $OPT 
				;;
			"-h")
				performTask $OPT 
				;;
			"-q")
				exit 1
				;;
		esac
	done
else
#check arguments if they are valid
	for ARG in "$@";
	do
		#Check for -h or invalid options
		if [[ " ${MENU[*]} " != *" $ARG "* ]];
		then
			performTask -h
			exit 1
		else
			performTask $ARG
		fi
	done
	exit 1
fi
}
main $@




	


