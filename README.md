# @jcesarmobile/permissionless-photo-picker

Cordova plugin for picking images without requesting permissions

## Installation

    cordova plugin add @jcesarmobile/permissionless-photo-picker

## Usage

```
window.plugins.PermissionlessPhotoPicker.pickImages(
    function(res){
        console.log(res)
    },
    function(err){
        console.log(err)
    }
);
```