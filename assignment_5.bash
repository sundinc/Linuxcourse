#!/bin/bash
clear
VAR1="thirteen"
export VAR2="13"
VAR3="Happy birthday"
function dispVars() {
	for i in $@;
	do
		echo $i
	done
}
function dispVar() {
	for i in $@;
	do
		bash -c "echo \$i"
	done
}
echo "Running assignment 5"
for i in $@;
do
	if [ "$i" == "-h" ];
       	then
		echo 'Try other input as well, this flag exits the script immiedietly'
		exit 1
	elif [ "$i" == "-p" ];
	then
		echo "Flag -p, good choice"
	fi
done
dispVars $VAR1 $VAR2 $VAR3
dispVar $VAR3 $VAR2 $VAR1
