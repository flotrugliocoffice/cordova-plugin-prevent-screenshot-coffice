

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
        _mainView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.7];
        _recordingStatusLabel.text = @"Recording status: YES";
    } else {
        _mainView.backgroundColor = [UIColor yellowColor];
        _recordingStatusLabel.text = @"Recording status: NO";

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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
