# MyBoardOpenCore

If you have the OpenCore source code on your machine - or at least [this directory](https://github.com/acidanthera/OpenCorePkg/tree/master/AppleModels/DataBase) - and (as a one time step) edit the `cd` command at the start of these two batch files to change dir to your copy of that directory, then:

 - `myboard` will look up your (actual or OC configured) board id in SMBIOS, and will show that plus the corresponding machine name (e.g. iMac5,1) which it looks up in the OC .yaml files

 - `whichboard` will take a single machine name (e.g. iMac5,1) as an argument, and show you the corresponding board id looked up in the OC .yaml files

 ```
$ ./myboard.sh 
Board ID: "Mac-AFD8A9D944EA4843"
SystemProductName: "MacBookPro10,2"
 ```
 ```
$ ./whichboard.sh iMac5,1
BoardProduct: "Mac-F4228EC8"
$ ./whichboard.sh MacPro5,1
BoardProduct: "Mac-F221BEC8"
$ ./whichboard.sh MacBookPro11,1
BoardProduct: "Mac-189A3D4F975D5FFC"
 ```

