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
sfdx config:set defaultusername=$usernameSO

# Assign standard Sales User permission set to user
#sfdx force:user:permset:assign -u $1 -n SalesUserPsl

#push metadata
#sfdx force:source:push -f && echo "Succesfully pushed the metadata to the empty scratch org 😎" || {
#    echo "Not possible to push the metadata to your scratch Org ❌"
#    exit 1
#}

# Import data to scratch org
#sfdx force:data:tree:import -p ./data/plan.json --loglevel DEBUG && echo "Added some data to play around with 🐎" ||
    #echo "Not possible to insert the data records. However, you still have some standard data records in your scratch org."