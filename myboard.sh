#!/bin/bash

# cd to own dir in case we are run from a symlink
SELF_PATH=$(perl -MCwd -le 'print Cwd::abs_path shift' "$0")&& SELF_PATH=$(dirname $SELF_PATH)
cd $SELF_PATH

# get board-id into a shell var
eval "$(ioreg -l | grep board-id | awk -F '[><]' '{print "MyBoard=" $2}')"

echo Board-ID: \"$MyBoard\"

# show the matching SystemProductName from each OC .yaml file file which contains board-id
grep -rnl ../OpenCorePkg/AppleModels/DataBase -e $MyBoard | xargs grep -w -e SystemProductName
