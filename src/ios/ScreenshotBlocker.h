#import <Cordova/CDV.h>
#import "ScreenRecordingDetector.h"


@interface ScreenshotBlocker : CDVPlugin

- (void)enable:(CDVInvokedUrlCommand*)command;

@end
