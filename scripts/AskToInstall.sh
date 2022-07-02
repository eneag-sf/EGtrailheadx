#!/bin/bash
#echo "Do you wish to install this program?"
#select yn in "Yes" "No"; do
#    case $yn in
#        Yes ) sfdx sfdmu:run -s csvfile -u EG-Data2 -c -n -p data ; break;;
#        No ) exit;;
#    esac
#done

# Get input if data should be re-migrated to the fetched org
read -p "Do you want to re-migrate data (y/n)?"
if [ "$REPLY" = "y" ]; then
   sfdx sfdmu:run -s csvfile -u EG-Data2 -c -n -p data
  if [ "$REPLY" = "yes" ]; then
   sfdx sfdmu:run -s csvfile -u EG-Data2 -c -n -p data
fi