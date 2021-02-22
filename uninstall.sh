#!/bin/bash

# Copyright (c) 2021, Mike Beaton. All rights reserved.
# This program and the accompanying materials
# are licensed and made available under the terms and conditions of the BSD License
# which accompanies this distribution.  The full text of the license may be found at
# http://opensource.org/licenses/bsd-license.php
#
# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
# WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

echo "Uninstalling myboard..."

# cd to own dir in case we are run from a symlink
SELF_PATH=$(perl -MCwd -le 'print Cwd::abs_path shift' "$0")&& SELF_PATH=$(dirname $SELF_PATH)
cd $SELF_PATH

# remove local copy of OpenCore's AppleModels directory
if [ -d "./OpenCorePkg" ]; then
    echo "Removing OC AppleModels dir..."
    rm -rf ./OpenCorePkg
fi

# remove symlink
if [ -L "/usr/local/bin/myboard" ]; then
    echo "Removing /usr/local/bin/myboard..."
    rm /usr/local/bin/myboard
fi

echo "Done."
