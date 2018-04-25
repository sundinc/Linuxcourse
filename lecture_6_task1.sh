#!/bin/bash
echo "this is the name of the file: $0"
if [ "$#" ==  0 ]; then
 exit
fi
if [ "$1" != 0 ]; then
 echo "argument 1: ${1}"
fi
if [ "$2" != 0 ]; then
echo "argument 3: ${3}"
fi
if [ "${10}" != "" ]; then
echo "argument 10: ${10}"
fi
echo "The number of arguments: $#"
if [ $# > 3 ]; then
shift 3
fi
echo "$@"
echo "The remaining nr of arguments: $#"
