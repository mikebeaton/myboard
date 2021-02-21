#!/bin/bash

SELF_PATH=$(perl -MCwd -le 'print Cwd::abs_path shift' "$0")&& SELF_PATH=$(dirname $SELF_PATH)
cd $SELF_PATH

eval "$(ioreg -l | grep board-id | awk -F '[><]' '{print "MyBoard=" $2}')"
echo $MyBoard
cd ../OpenCorePkg/AppleModels/DataBase
grep -rnw . -e $MyBoard
