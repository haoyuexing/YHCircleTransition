//
//  YHCircleTransitionDelegate.m
//  YHCircleTransitionDemo
//
//  Created by HaoYoson on 16/4/8.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import "YHCircleTransition.h"
#import "YHCircleTransitionDelegate.h"

@implementation YHCircleTransitionDelegate

static id _instance = nil;

+ (instancetype)sharedTransitionDelegate
{
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[self alloc] init];
        });
    }
    return _instance;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [YHCircleTransition transitionWithMode:YHCircleTransitionModePresenting];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [YHCircleTransition transitionWithMode:YHCircleTransitionModeDismissing];
}

@end
