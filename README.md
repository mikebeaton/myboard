# MyBoard

You can just clone this project and immediately run `./myboard.sh` - assuming this project has been cloned into the same parent directory as an existing copy of Acidanthera's [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg), then it will find the required OpenCore files and just work.

However it now comes with an installer (recommended) which clones a copy of the required OpenCore Mac model database files (inside a `.gitgnore`d subdirectory of your copy of this repo), and also symlinks this tool as a command called `myboard` available from anywhere. Matching uninstaller (deletes the `myboard` symlink and removes the downloaded OC files) also provided.

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

