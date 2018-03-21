//
//  XLGCDTimer.h
//  GCDTimer
//
//  Created by xiaolin on 2018/3/20.
//  Copyright © 2018年 xiaolin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLGCDTimer : NSObject

/*
 create a timer
 */
+ (XLGCDTimer *)timerWithInterval:(NSTimeInterval)interval block:(dispatch_block_t)block;

//fire the timer
- (void)fire;
/*
 stop the timer
 */
- (void)stop;

@end
