#!/bin/bash
echo -n "Welcome to systembolaget. Enter your birthdate (YYYY-MM-DD) digits): "
read -n 10 -t 30 BIRTHDATE
#check if input is valid by bitwise checking the read input. All must be digits to be a valid option
while ! date -d "$(BIRTHDATE)" + ; do
	clear
	printf "\n"
	read -n 10 -p "Not a valid date, try again: " -t 30 BIRTHDATE
done
	
if (( "$year" > "$LegalDays" )); then
	echo "Continue to scan your items"
else
	echo "You will have to wait $year days before you can shop at Systembolaget"
fi  
printf "\n down here $year$month$day\n"
echo "end"
