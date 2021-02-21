#!/bin/bash

# change dir to OC model DB dir
cd ~/OpenSource/OpenCorePkg/AppleModels/DataBase

# get board-id into shell var
eval "$(ioreg -l | grep board-id | awk -F '[><]' '{print "MyBoard=" $2}')"

# show detected board id
echo Board ID: \"$MyBoard\"

# show the matching SystemProductName from each OC .yaml file file which contains board id
grep -rnl . -e $MyBoard | xargs grep -w -e SystemProductName
