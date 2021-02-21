#!/bin/bash

# check first arg exists, if not show usage
if [ "$1" == "" ]; then
    echo "Usage: whichboard <model-name> (e.g. whichboard iMac5,1)"
    exit 0
fi

# change dir to OC model DB dir inside OpenCorePkg
cd ~/OpenSource/OpenCorePkg/AppleModels/DataBase

# show the matching BoardProduct from each OC .yaml file file which contains model name
grep -rnl . -e $1 | xargs grep -w -e "BoardProduct: "
