//
//  CAGradientLayer+Additions.h
//  test
//
//  Created by HaoYoson on 16/3/25.
//  Copyright © 2016年 ITCAST. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAGradientLayer (Additions)

+ (instancetype)verticalGradientLayerWithFrame:(CGRect)frame andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor;

+ (instancetype)horizontalGradientLayerWithFrame:(CGRect)frame andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor;

@end
