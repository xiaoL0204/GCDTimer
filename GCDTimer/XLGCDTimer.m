//
//  XLGCDTimer.m
//  GCDTimer
//
//  Created by xiaolin on 2018/3/20.
//  Copyright © 2018年 xiaolin. All rights reserved.
//

#import "XLGCDTimer.h"

@interface XLGCDTimer()
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation XLGCDTimer

+ (XLGCDTimer *)timerWithInterval:(NSTimeInterval)interval block:(dispatch_block_t)block{
    //DISPATCH_TIME_NOW 当系统休眠的时候会停止计时，待系统重新激活时, 接着继续计时。使用 dispatch_walltime 还会继续计时。
    //通常dispatch_time用于计算相对时间，dispatch_walltime用于计算绝对时间
    
    XLGCDTimer *gcdTimer = [[XLGCDTimer alloc] init];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    gcdTimer.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(gcdTimer.timer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(gcdTimer.timer, ^{
        if (block) {
            block();
        }
    });
    
    return gcdTimer;
}

- (void)fire{
    dispatch_resume(self.timer);
}

- (void)stop{
    dispatch_source_cancel(self.timer);
    self.timer = nil;
}
@end
