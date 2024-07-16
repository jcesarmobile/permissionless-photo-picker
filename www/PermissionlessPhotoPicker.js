const exec = require('cordova/exec');

const permissionlessPhotoPickerExport = {};

permissionlessPhotoPickerExport.pickImages = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'PermissionlessPhotoPicker', 'pickImages', []);
};

module.exports = permissionlessPhotoPickerExport;