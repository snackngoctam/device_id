#import "DeviceIdPlugin.h"
#import "AppKeyChain.h"

@implementation DeviceIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter.io/iOSIMEI"
            binaryMessenger:[registrar messenger]];
  DeviceIdPlugin* instance = [[DeviceIdPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"iOSIMEI" isEqualToString:call.method]) {
    result([[AppKeyChain shared]IMEI]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
