#!/bin/bash
year=$(date +%y)
day=$(date +%d)
month=$(date +%m)
LegalDays=20*365
numbers='^[0-9]+$'
echo -n "Welcome to systembolaget. Enter your birthdate (6 digits): "
read -n 6 -t 30 BIRTH
#check if input is valid by bitwise checking the read input. All must be digits to be a valid option
while ( ! [[ $BIRTH =~ $numbers ]] ) ; do
	printf "\n"
	read -n 6 -p "Retry: " -t 30 BIRTH
done
	
if (( "$year" > "$LegalDays" )); then
	echo "Continue to scan your items"
else
	echo "You will have to wait $year days before you can shop at Systembolaget"
fi  
printf "\n down here $year$month$day\n"
echo "end"
