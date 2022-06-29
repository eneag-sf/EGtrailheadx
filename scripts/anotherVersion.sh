#!/bin/bash
file1=`grep -i -o '[A-Z0-9._%+-]\+@example\+\.[A-Z]\{2,4\}' authInfo.txt`
echo $file1