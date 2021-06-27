#import "UniversalLoginPlugin.h"
#if __has_include(<universal_login/universal_login-Swift.h>)
#import <universal_login/universal_login-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "universal_login-Swift.h"
#endif

@implementation UniversalLoginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUniversalLoginPlugin registerWithRegistrar:registrar];
}
@end
