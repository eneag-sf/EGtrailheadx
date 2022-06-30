#!/bin/bash
username="$(grep -oP '^username\s+\K\S+' authInfo.txt)"
echo $username
sfdx sfdmu:run --sourceusername $username --targetusername csvfile -p data --concise