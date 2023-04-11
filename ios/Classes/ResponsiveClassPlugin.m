#import "ResponsiveClassPlugin.h"
#if __has_include(<responsive_class/responsive_class-Swift.h>)
#import <responsive_class/responsive_class-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "responsive_class-Swift.h"
#endif

@implementation ResponsiveClassPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftResponsiveClassPlugin registerWithRegistrar:registrar];
}
@end
