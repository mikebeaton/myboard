#!/bin/bash

# Copyright (c) 2021, Mike Beaton. All rights reserved.
# This program and the accompanying materials
# are licensed and made available under the terms and conditions of the BSD License
# which accompanies this distribution.  The full text of the license may be found at
# http://opensource.org/licenses/bsd-license.php
#
# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
# WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

# cd to own dir in case we are run from a symlink
SELF_PATH=$(perl -MCwd -le 'print Cwd::abs_path shift' "$0")&& SELF_PATH=$(dirname $SELF_PATH)
cd $SELF_PATH

# find own or user copy of OC
if [ -d "./OpenCorePkg" ]; then
    cd ./OpenCorePkg/AppleModels/DataBase
elif [ -d "../OpenCorePkg" ]; then
    cd ../OpenCorePkg/AppleModels/DataBase
else
    echo "Cannot find OpenCorePkg directory."
    exit -1
fi

# if first first arg does not exist, look up installed board id
if [ "$1" == "" ]; then
    # get board-id into shell var
    eval "$(ioreg -l | grep board-id | awk -F '[><]' '{print "MY_BOARD=" $2}')"

    # show detected board id
    echo Board ID: \"$MY_BOARD\"
else
    # search for user arg
    MY_BOARD=$1

    # show the matching BoardProduct from each OC .yaml file file which contains model name
    grep -rnl . -e $1 | xargs grep -w -e "BoardProduct: "
fi

# show the matching SystemProductName from each OC .yaml file file which contains board id
grep -rnl . -e $MY_BOARD | xargs grep -w -e SystemProductName
