//
//  ScreenRecordingDetector.h
//

/*
ScreenRecordingDetector checks for screen capturing as well as airplay mirroring
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *kScreenRecordingDetectorRecordingStatusChangedNotification;

@interface ScreenRecordingDetector : NSObject

+(instancetype)sharedInstance;
+ (void)triggerDetectorTimer;
+ (void)stopDetectorTimer;
- (BOOL)isRecording;

@end