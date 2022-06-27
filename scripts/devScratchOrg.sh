#!/bin/bash
#function to delete scratchOrg and feature branch
clearSetup(){
    git checkout master
    git branch -D feature/$1
    echo "An error occured while fetching your scratch org. Please ask your Salesforce Admin for help."
    exit 1
}

if [ -z $1 ]
  then
    echo "Please add argument for the branch name. Recommended format is <initials of developer>-<User story id>"
    exit 1
fi

git fetch --prune && git checkout master && git pull origin master && git checkout -b feature/$1 || {
    echo "something went wrong. Make a screenshot from the console and send to your admin."
    exit 1
}
bash ./scripts/fetchScratchOrg.sh $1 ||
    clearSetup $1
    
git push --set-upstream origin feature/$1