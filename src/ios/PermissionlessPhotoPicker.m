#import <Cordova/CDV.h>
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>
@import MobileCoreServices;

@interface PermissionlessPhotoPicker : CDVPlugin <PHPickerViewControllerDelegate>

- (void)pickImages:(CDVInvokedUrlCommand*)command;
@property (copy)   NSString* callbackId;

@end

@implementation PermissionlessPhotoPicker


- (void)pickImages:(CDVInvokedUrlCommand*)command {
    self.callbackId = command.callbackId;
    PHPickerConfiguration *config = [[PHPickerConfiguration alloc] init];
    config.filter = [PHPickerFilter imagesFilter];

    PHPickerViewController *pickerViewController = [[PHPickerViewController alloc] initWithConfiguration:config];
    pickerViewController.delegate = self;
    [self.viewController presentViewController:pickerViewController animated:YES completion:nil];
}

-(void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results{
   [picker dismissViewControllerAnimated:YES completion:nil];
    
   for (PHPickerResult *result in results)
   {
       [result.itemProvider loadItemForTypeIdentifier:(NSString *)kUTTypeImage options:nil completionHandler:^(id item, NSError *error) {
           CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[item absoluteString]];
           [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
        }];
   }
}

@end
