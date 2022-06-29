#!/bin/bash
username="$(grep -oP '^username\s+\K\S+' authInfo.txt)"
echo $username