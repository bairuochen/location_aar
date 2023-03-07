#import "LocationAarPlugin.h"
#import <MapManager/MapManager.h>

@implementation LocationAarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"location_aar"
            binaryMessenger:[registrar messenger]];
  LocationAarPlugin* instance = [[LocationAarPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

  MapService *mapService = [[MapService alloc]init];
  NSDictionary *arguments = (NSDictionary*)call.arguments;
  // NSLog(@"arguments = %@", arguments);
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"auth" isEqualToString:call.method]){
      
      [mapService openServiceWithAppId:arguments[@"appId"] appSecurity:arguments[@"appSecret"] enterpriseSenderCode:arguments[@"enterpriseSenderCode"] environment:arguments[@"environment"] listener:^(id  _Nonnull model) {
          // NSLog(@"auth-model = %@", model);
          result(model);
      }];
  }else if ([@"start" isEqualToString:call.method]){
      NSArray *arr = (NSArray*)arguments[@"shippingNoteInfos"];
      // NSLog(@"arr = %@",arr);
      // NSLog(@"vehicleNumber = %@",arguments[@"vehicleNumber"]);
      // NSLog(@"driverName = %@",arguments[@"driverName"]);
      [mapService startLocationWithShippingNoteInfos:arr driverNameView:[NSString stringWithFormat:@"%@",arguments[@"driverName"]] vehicleNumberView:arguments[@"vehicleNumber"] remark:arguments[@"remark"] listener:^(id  _Nonnull model) {
          // NSLog(@"start-model = %@", model);
          result(model);
      }];
  }else if ([@"send" isEqualToString:call.method]){
      
      NSArray *arr = (NSArray*)arguments[@"shippingNoteInfos"];
      [mapService sendLocationWithShippingNoteInfos:arr driverNameView:arguments[@"driverName"] vehicleNumberView:arguments[@"vehicleNumber"] remark:arguments[@"remark"] listener:^(id  _Nonnull model) {
          // NSLog(@"send-model = %@", model);
          result(model);

      }];
  }else if ([@"pause" isEqualToString:call.method]){
      NSArray *arr = (NSArray*)arguments[@"shippingNoteInfos"];
      [mapService pauseLocationWithShippingNoteInfos:arr driverNameView:arguments[@"driverName"] vehicleNumberView:arguments[@"vehicleNumber"] remark:arguments[@"remark"] listener:^(id  _Nonnull model) {
          // NSLog(@"pause-model = %@", model);
          result(model);
      }];
  }else if ([@"restart" isEqualToString:call.method]){
      NSArray *arr = (NSArray*)arguments[@"shippingNoteInfos"];
      [mapService reStartLocationWithShippingNoteInfos:arr driverNameView:arguments[@"driverName"] vehicleNumberView:arguments[@"vehicleNumber"] remark:arguments[@"remark"] listener:^(id  _Nonnull model) {
          // NSLog(@"restart-model = %@", model);
          result(model);
      }];
  }else if ([@"stop" isEqualToString:call.method]){
      NSArray *arr = (NSArray*)arguments[@"shippingNoteInfos"];
      [mapService stopLocationWithShippingNoteInfos:arr driverNameView:arguments[@"driverName"] vehicleNumberView:arguments[@"vehicleNumber"] remark:arguments[@"remark"] listener:^(id  _Nonnull model) {
          // NSLog(@"stop-model = %@", model);
          result(model);
      }];
  }
   else {
    result(FlutterMethodNotImplemented);
  }
}
@end
