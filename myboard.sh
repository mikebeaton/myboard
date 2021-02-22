#!/bin/bash

# Copyright (c) 2021, Mike Beaton. All rights reserved.
# This program and the accompanying materials
# are licensed and made available under the terms and conditions of the BSD License
# which accompanies this distribution.  The full text of the license may be found at
# http://opensource.org/licenses/bsd-license.php
#
# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
# WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.


DETECT_BOARD_ID=1

version () {
  echo "myboard v0.2.1 - Copyright (c) 2021, Mike Beaton."
}
while true; do
  if [ "$1" == "-v" ] || [ "$1" == "--version" ]; then
    version
    exit 0
  elif [ "$1" == "-?" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    version
    echo
    echo "Usage:"
    echo
    echo "  myboard"
    echo "    Detect installed board id, lookup corresponding product name"
    echo
    echo "  myboard -n"
    echo "    Detect installed product name, lookup corresponding board id"
    echo
    echo "  myboard {id-text}"
    echo "    Case insensitive lookup all or part of any board id or product name"
    echo
    exit 0
  elif [ "$1" == "-n" ]; then
    DETECT_BOARD_ID=0
    shift
  else
    break
  fi
done

# cd to own dir in case we are run from a symlink
SELF_PATH=$(perl -MCwd -le 'print Cwd::abs_path shift' "$0")&& SELF_PATH=$(dirname $SELF_PATH)
cd $SELF_PATH

# find own or user copy of OC
if [ -d "./OpenCorePkg" ]; then
    cd ./OpenCorePkg/AppleModels/DataBase
elif [ -d "../OpenCorePkg" ]; then
    cd ../OpenCorePkg/AppleModels/DataBase
else
    echo "Cannot find OpenCorePkg directory. You may either clone the MyBoardOpenCore"
    echo "repo as a peer of (i.e. at same director level as) Acidanthera's OpenCorePkg,"
    echo "or run install.sh to clone own local copy of just the required .yaml files."
    exit -1
fi

# if first first arg does not exist, look up installed board id
if [ "$1" == "" ]; then
    if [ "$DETECT_BOARD_ID" == "1" ]; then
        # get board-id into shell var
        eval "$(ioreg -l | grep board-id | awk -F '[><]' '{print "MY_BOARD=" $2}')"
        # show detected board id
        echo "detected board-id:" \"$MY_BOARD\"
    else
        # get product-name into shell var
        eval "$(ioreg -l | grep product-name | awk -F '[><]' '{print "MY_BOARD=" $2}')"
        # show detected board id
        echo "detected product-name:" \"$MY_BOARD\"
    fi
    echo
else
    # search for user arg
    MY_BOARD=$1
fi

if [ "$1" != "" ] || [ "$DETECT_BOARD_ID" = "0" ]; then
    # show the matching BoardProduct from each OC .yaml file file which contains model name
    grep -irnl . -e $MY_BOARD | xargs grep -we "BoardProduct: "
fi

if [ "$1" != "" ] || [ "$DETECT_BOARD_ID" = "1" ]; then
    # show the matching SystemProductName from each OC .yaml file file which contains board id
    grep -irnl . -e $MY_BOARD | xargs grep -we "SystemProductName"
fi