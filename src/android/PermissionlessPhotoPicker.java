package com.jcesarmobile.permissionless.photopicker;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.PickVisualMediaRequest;
import androidx.activity.result.contract.ActivityResultContracts;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class PermissionlessPhotoPicker extends CordovaPlugin {

    private static final String PICK_IMAGES = "pickImages";

    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals(PICK_IMAGES)) {
            ActivityResultLauncher<PickVisualMediaRequest> pickMedia =
                    cordova.getActivity().registerForActivityResult(new ActivityResultContracts.PickVisualMedia(), uri -> {
                        if (uri != null) {
                            callbackContext.success(String.valueOf(uri));
                        } else {
                            callbackContext.error("no image picked");
                        }
                    });
            pickMedia.launch(new PickVisualMediaRequest.Builder()
                    .setMediaType(ActivityResultContracts.PickVisualMedia.ImageOnly.INSTANCE)
                    .build());

            return true;
        }
        return false;
    }
}
