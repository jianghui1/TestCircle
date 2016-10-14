//
//  ToolKit.m
//  TestCircle
//
//  Created by ys on 15/12/28.
//  Copyright © 2015年 ys. All rights reserved.
//

#import "ToolKit.h"

#import "MBProgressHUD.h"

@implementation ToolKit

static UIViewController *_vc;

static ToolKit *_toolKit;
+ (ToolKit *)toolKit
{
    if (!_toolKit) {
        _toolKit = [[ToolKit alloc] init];
    }
    return _toolKit;
}

+ (void)showHUD:(UIViewController *)viewcontroller
{
    _vc = viewcontroller;
    
    [MBProgressHUD showHUDAddedTo:viewcontroller.view animated:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction:) userInfo:nil repeats:NO];
        NSRunLoop *loop = [NSRunLoop currentRunLoop];
        [loop run];
    });
}

+ (void)timerAction:(NSTimer *)timer
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@", [NSThread currentThread]);
        [MBProgressHUD hideHUDForView:_vc.view animated:YES];
    });
}

@end
