#import "ScreenshotBlocker.h"

@implementation ScreenshotBlocker
    UIImageView* cover;
- (void)pluginInitialize {
    NSLog(@"Starting ScreenshotBlocker plugin");

    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(appDidBecomeActive)
                                                name:UIApplicationDidBecomeActiveNotification
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(applicationWillResignActive)
                                                name:UIApplicationWillResignActiveNotification
                                              object:nil];
    /*
     [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(screenCaptureStatusChanged)
                                                name:UIApplicationUserDidTakeScreenshotNotification
                                              object:nil];
    */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenCaptureStatusChanged)
                                                 name:kScreenRecordingDetectorRecordingStatusChangedNotification
                                               object:nil];

    /*
     userDidTakeScreenshotNotification
    */

}

- (void)enable:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSLog(@"Abilita observers");
    /*
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(appDidBecomeActive)
                                                name:UIApplicationDidBecomeActiveNotification
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(applicationWillResignActive)
                                                name:UIApplicationWillResignActiveNotification
                                              object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenCaptureStatusChanged)
                                                 name:kScreenRecordingDetectorRecordingStatusChangedNotification
                                               object:nil];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    */
}


-(void)setupView {
    BOOL isCaptured = [[UIScreen mainScreen] isCaptured];
    NSLog(@"Is screen captured? %@", (isCaptured?@"SI":@"NO"));

    if ([[ScreenRecordingDetector sharedInstance] isRecording]) {
        [self webView].alpha = 0.f;
        NSLog(@"Registro o prendo screenshots");
    } else {
        [self webView].alpha = 1.f;
        NSLog(@"Non registro");

    }
}

-(void)appDidBecomeActive {
    [ScreenRecordingDetector triggerDetectorTimer];
    if(cover!=nil) {
        [cover removeFromSuperview];
        cover = nil;
    }
}
-(void)applicationWillResignActive {
    [ScreenRecordingDetector stopDetectorTimer];
    if(cover == nil) {
        cover = [[UIImageView alloc] initWithFrame:[self.webView frame]];
        cover.backgroundColor = [UIColor blackColor];
        [self.webView addSubview:cover];
    }
}
-(void)screenCaptureStatusChanged {
    [self setupView];
}


@end
