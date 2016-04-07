//
//  YHCircleTransitionDelegate.h
//  YHCircleTransitionDemo
//
//  Created by HaoYoson on 16/4/8.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YHCircleTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>

+ (instancetype)sharedTransitionDelegate;

@end
