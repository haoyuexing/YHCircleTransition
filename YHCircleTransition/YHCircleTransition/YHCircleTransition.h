//
//  YHCircleTransition.h
//  YHCircleTransitionDemo
//
//  Created by HaoYoson on 16/4/8.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    YHCircleTransitionModePresenting,
    YHCircleTransitionModeDismissing,
} YHCircleTransitionMode;

@interface YHCircleTransition : NSObject <UIViewControllerAnimatedTransitioning>

// 动画时间
@property (assign, nonatomic) NSTimeInterval transitionDuration;
// 圆心中心点
@property (assign, nonatomic) CGPoint transitionCenter;
// 动画模式(出现,消失)
@property (assign, nonatomic) YHCircleTransitionMode transitionMode;

+ (instancetype)transitionWithMode:(YHCircleTransitionMode)transitionMode;

@end
