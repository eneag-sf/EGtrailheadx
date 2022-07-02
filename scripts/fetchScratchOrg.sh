#!/bin/bash
if [ -z $1 ]
  then
    echo "No argument for a branch name. Recommended format is <initials of developer>.<User story id>"
    exit 1
fi

# Fetch Scratch Org from DEV Pool
sfdx sfpowerkit:pool:fetch -t dev > authInfo.txt

# Find the username of the fetched Scratch Org and assign it to a variable
usernameSO="$(grep -oP '^username\s+\K\S+' authInfo.txt)"
echo $usernameSO

# Set alias for scratch Org the same as the feature branch
sfdx force:alias:set $1=$usernameSO

# Assign the scratch Org as deafult
sfdx config:set defaultusername=$1

# Push latest changed metadata to Scratch Org
# Don't forget that the scratch Orgs are created at 5AM and with the latest packages published. Developers might have already made changes to the metadata/records so this steps makes sure that the latest metadata is avaliable
sfdx force:source:push -f -u $1

# Get input if data should be re-migrated to the fetched org
read -p "Do you want to re-migrate data (y/n)?"
if [ "$REPLY" = "y" ]; then
   sfdx sfdmu:run -s csvfile -u $1 -c -n -p data
  if [ "$REPLY" = "yes" ]; then
   sfdx sfdmu:run -s csvfile -u $1 -c -n -p data
fi

# Reset tracking to avoid unnessesary changes like layouts being pulled
sfdx force:source:tracking:reset -u $1 --noprompt
echo "Your new scratch org will open in your browser within a few seconds...✅"

# Opens the scratch Org in a browser Tab when the build is finished
sfdx force:org:open -u $1