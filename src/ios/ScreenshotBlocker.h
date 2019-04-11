#import <Cordova/CDV.h>
#import "ScreenRecordingDetector.h"


@interface ScreenshotBlocker : CDVPlugin

- (void)enable:(CDVInvokedUrlCommand*)command;
-(void)listen:(CDVInvokedUrlCommand*)command;

@end
