//
//  SecondViewController.m
//  GCDTimer
//
//  Created by xiaolin on 2018/3/20.
//  Copyright © 2018年 xiaolin. All rights reserved.
//

#import "SecondViewController.h"
#import "XLGCDTimer.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (nonatomic, strong) XLGCDTimer *timer;

@property (nonatomic, assign) NSInteger count;
@end

@implementation SecondViewController

- (void)dealloc{
    NSLog(@"[%@] dealloc", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateCountLabelWithCount:0];
}

- (void)updateCountLabelWithCount:(NSInteger)count{
    self.count = count;
    self.countLabel.text = [NSString stringWithFormat:@"%@", @(self.count)];
}


- (IBAction)startTimer:(id)sender {
    __weak __typeof(self) weakSelf = self;
    
    self.timer = [XLGCDTimer timerWithInterval:1.0 block:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf updateCountLabelWithCount:weakSelf.count+1];
        });
    }];
    [self.timer fire];
}

- (IBAction)stopTimer:(UIButton *)sender {
    [self.timer stop];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
