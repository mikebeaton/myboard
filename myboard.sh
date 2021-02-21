#!/bin/bash

eval "$(ioreg -l | grep board-id | awk -F '[><]' '{print "MyBoard=" $2}')"
echo $MyBoard
cd ../OpenCorePkg/AppleModels/DataBase
grep -rnw . -e $MyBoard
