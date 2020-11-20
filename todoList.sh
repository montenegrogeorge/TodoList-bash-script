#!/bin/bash 
# A TodoList 

# Checks if todoList.txt exist, if not creates it
FILE=~/todoList.txt
if test ! -f "$FILE"; then
   touch $FILE
fi


# Iterates through the file to delete completed tasks 
function finishedTasks() {

	LineNoCtr=0
	while IFS= read -r line <&3; do
        	echo "     $line: Completed? [y/n]"
		read completed
		if [ ${completed} == "y" ] 
		then 
			sed -i "1 d" $FILE
        	fi
		LineNoCtr+=1
		sleep 1
	done 3< $FILE
}


# getops helps configure flags and run proper functions
while getopts ":a:f" opt;
do
	case $opt in
		a)
			echo $2 >> $FILE # pushes the task to the todoList
			;;
 		f)
			echo ""
			echo "##### Finished Task Mode: #####" # Iterates through text file and removes finished task 
			finishedTasks
			echo ""
			exit 
			;;	
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done







 
