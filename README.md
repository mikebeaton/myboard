# MyBoardOpenCore

Assuming this project is cloned as a peer of (i.e. at same dir level as) Acidanthera's [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg), then it will search in OpenCore's `.yaml` config files in order to convert
from board ID (e.g. Mac-42FD25EABCABB274) to board name (e.g. iMac15,1) and vice versa. When run with no args it
will look up your own currently installed board ID and show the matching board name.

**UPDATE:** Now with installer (clones own local copy of required OC files, and symlinks this tool as a command called `myboard` available from anywhere) and matching uninstaller.

*Example usage:*

 ```
$ myboard
Board ID: "Mac-189A3D4F975D5FFC"
SystemProductName: "MacBookPro11,1"

$ myboard MacBookPro10,2
BoardProduct: "Mac-AFD8A9D944EA4843"
SystemProductName: "MacBookPro10,2"

$ myboard iMac15,1
BoardProduct: "Mac-42FD25EABCABB274"
SystemProductName: "iMac15,1"

$ myboard MacPro5,1
BoardProduct: "Mac-F221BEC8"
SystemProductName: "MacPro5,1"

$ myboard Mac-F221BEC8
./MacPro/MP41.yaml:BoardProduct: "Mac-F221BEC8"
./MacPro/MP51.yaml:BoardProduct: "Mac-F221BEC8"
./MacPro/MP41.yaml:SystemProductName: "MacPro4,1"
./MacPro/MP51.yaml:SystemProductName: "MacPro5,1"
 ```

