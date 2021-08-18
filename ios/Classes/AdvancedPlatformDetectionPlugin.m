#import "AdvancedPlatformDetectionPlugin.h"
#if __has_include(<advanced_platform_detection/advanced_platform_detection-Swift.h>)
#import <advanced_platform_detection/advanced_platform_detection-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "advanced_platform_detection-Swift.h"
#endif

@implementation AdvancedPlatformDetectionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAdvancedPlatformDetectionPlugin registerWithRegistrar:registrar];
}
@end
