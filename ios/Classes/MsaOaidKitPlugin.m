#import "MsaOaidKitPlugin.h"
#if __has_include(<msa_oaid_kit/msa_oaid_kit-Swift.h>)
#import <msa_oaid_kit/msa_oaid_kit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "msa_oaid_kit-Swift.h"
#endif

@implementation MsaOaidKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMsaOaidKitPlugin registerWithRegistrar:registrar];
}
@end
