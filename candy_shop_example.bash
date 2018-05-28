#!/bin/bash
# Display welcome message and ask for birthdate:
clear
echo -e "Welcome to the Children's Candyshop!\n\nHow old are you (YYYY-MM-DD)?"
read -n 10 BIRTHDATE
# Check if birthdate is valid; ask again if not:
while ! date -d "${BIRTHDATE}" + ; do
  clear
  echo -e "This is not a valid date. Please provide your birthdate (YYYY-MM-DD):"
  read -n 10 BIRTHDATE
done
#Calculate lowest birthdate of a child under 12 and convert dates to epoch time:
EARLIESTBIRTHDATE=$( date -d "-12 years" +%s )
BIRTHDATE=$( date -d "${BIRTHDATE}" +%s )
# Check if customer is younger than 12 years and display appropriate message:
if (( BIRTHDATE > EARLIESTBIRTHDATE )) ; then
  echo -e "\nPlease weigh your candy...\n"
else
  echo -e "\nThis candy shop is for children. You are $(( (EARLIESTBIRTHDATE-BIRTHDATE)/86400 )) days too old.\n"
  echo -e "Don't take children's candy!!!\n"
fi
