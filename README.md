# MyBoard

You can just clone this project and immediately run `./myboard.sh` - assuming this project has been cloned into the same parent directory as an existing copy of Acidanthera's [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg), then it will find the required OpenCore files and just work.

If you don't have (and don't have any other reason to get) all of OpenCore, then instead clone a copy of this project with git, and first of all run `./install.sh` (feel free to read and check the contents!).
This clones a copy of the required OpenCore Mac model database files inside a `.gitgnore`d subdirectory of your copy of this repo, and also symlinks this tool as a command called `myboard` available from anywhere. A matching uninstaller `./uninstall.sh` removes the downloaded OC files and deletes the `myboard` symlink.

**Usage**

```
  myboard
    Detect installed board id, lookup corresponding product name

  myboard -n
    Detect installed product name, lookup corresponding board id

  myboard {id-text}
    Case insensitive lookup all or part of any board id or product name
```

**Examples**

On a MacBookPro10,2 hybridized (changed board-id only) to a MacBookPro11,1:

```
$ myboard
detected board-id: "Mac-189A3D4F975D5FFC"
SystemProductName: "MacBookPro11,1"
$ myboard -n
detected product-name: "MacBookPro10,2"
BoardProduct: "Mac-AFD8A9D944EA4843"
```

Also quick, case-insensitive lookups of anything 🥳:

```
$ myboard iMac15,1
BoardProduct: "Mac-42FD25EABCABB274"
SystemProductName: "iMac15,1"
$ myboard 42fd25
BoardProduct: "Mac-42FD25EABCABB274"
SystemProductName: "iMac15,1"
```

