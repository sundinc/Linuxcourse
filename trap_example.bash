#!/bin/bash
PID1=""
PID2=""
clear
# The following function starts the two sleep processes and records their PIDs:
startsleepingprocs()
{
  sleep 15 &
  PID1=$!
  sleep 30 &
  PID2=$!
  echo "Be quiet! Two child processes are sleeping..."
}
#The following function asks whether the child processes need be killed and kills as requested:
confirm()
{
  clear
  echo "Are you sure you want to kill this script? Two child processes are still sleeping! Type yes to kill the child processes:"
  read REPLY
  if [[ "${REPLY}" == "yes" ]] ; then
    kill ${PID1} ${PID2} 2>/dev/null
    exit
  fi
}
#Trap signals, start sleep processes, and wait while child processes exist:
trap confirm SIGINT SIGQUIT
startsleepingprocs
#Here I put a while loop around the wait command, since wait returns when a signal is received. In this way,
#the script will wait again for the child processes if the user chooses to cancel the interrupt signal.
#I also check if there still are child processes so the script ends if all child processes have completed.
#Finally, note that the ps command is itself a child process of the script; this is why we check if the number
# of child processes is larger than 1.
while (( $(ps --no-headers -o pid --ppid=$$ | wc -w) > 1 )) ; do
  wait
done
