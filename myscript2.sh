#!/bin/bash

if [ $1 = 'h']
echo "help"
fi
echo "Empty"
echo "First we display the home directory:"
echo $PWD 
echo "Then the number of processes running by the user:"
ps -c | grep -v 'PID' | wc -l
echo "And the number of processes in total on the system: "
ps -A | grep -v 'PID' | wc -l
echo "Physical amount of memory in kilobytes: "
awk '/MemTotal/{print $2}' /proc/meminfo
echo "Swap space in kilobytes: "
awk '/SwapTotal/{print $2}' /proc/meminfo

