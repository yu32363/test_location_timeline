//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<google_maps_flutter/FLTGoogleMapsPlugin.h>)
#import <google_maps_flutter/FLTGoogleMapsPlugin.h>
#else
@import google_maps_flutter;
#endif

#if __has_include(<image_picker/FLTImagePickerPlugin.h>)
#import <image_picker/FLTImagePickerPlugin.h>
#else
@import image_picker;
#endif

#if __has_include(<location/LocationPlugin.h>)
#import <location/LocationPlugin.h>
#else
@import location;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTGoogleMapsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleMapsPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [LocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationPlugin"]];
}

@end
