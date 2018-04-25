#!/bin/bash
echo "this is the name of the file: $0"
if [ $# ==  0 ]; then
 exit
fi
if [ $1 != 0 ]; then
 echo "argument 1: ${1}"
fi
if [ $2 !=  3 ]; then
echo "argument 4: ${3}"
fi
if [ ${10} != 10 ]; then
echo "argument 10: ${10}"
fi
echo "The number of arguments: $#"
