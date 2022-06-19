#!/bin/bash

# Copyright (c) 2021, Mike Beaton. All rights reserved.
# This program and the accompanying materials
# are licensed and made available under the terms and conditions of the BSD License
# which accompanies this distribution.  The full text of the license may be found at
# http://opensource.org/licenses/bsd-license.php
#
# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
# WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

echo "Installing myboard..."

# cd to own dir in case we are run from a symlink
SELF_PATH=$(perl -MCwd -le 'print Cwd::abs_path shift' "$0")&& SELF_PATH=$(dirname $SELF_PATH)
cd $SELF_PATH

# clone local copy of OpenCore's AppleModels directory
if [ ! -d "./OpenCorePkg" ]; then
    echo "Cloning OC AppleModels dir..."
    
    git clone \
    --depth 1  \
    --filter=blob:none  \
    --sparse \
    https://github.com/acidanthera/OpenCorePkg \
    ;
    cd OpenCorePkg
    git sparse-checkout init --cone
    git sparse-checkout set AppleModels
fi

# set up symlink
if [ -L "/usr/local/bin/myboard" ]; then
    echo "Removing old /usr/local/bin/myboard..."
    
    rm /usr/local/bin/myboard
fi

echo "Linking myboard.sh at /usr/local/bin/myboard..."
ln -s $SELF_PATH/myboard.sh /usr/local/bin/myboard

echo "Done."
