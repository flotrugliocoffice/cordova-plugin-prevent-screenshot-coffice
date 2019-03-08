#import "ScreenshotBlocker.h"
@implementation ScreenshotBlocker

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
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(screenCaptureStatusChanged)
                                                 name:kScreenRecordingDetectorRecordingStatusChangedNotification
                                               object:nil];

}


-(void)setupView {
    if ([[ScreenRecordingDetector sharedInstance] isRecording]) {
        [self webView].hidden = YES;
        NSLog(@"Registro o prendo screenshots");
    } else {
        [self webView].hidden = NO;
        NSLog(@"Non registro");

    }
}

-(void)appDidBecomeActive {
    [ScreenRecordingDetector triggerDetectorTimer];
}
-(void)applicationWillResignActive {
    [ScreenRecordingDetector stopDetectorTimer];
}
-(void)screenCaptureStatusChanged {
    [self setupView];
}


@end
