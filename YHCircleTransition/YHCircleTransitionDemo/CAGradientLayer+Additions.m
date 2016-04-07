//
//  CAGradientLayer+Additions.m
//  test
//
//  Created by HaoYoson on 16/3/25.
//  Copyright © 2016年 ITCAST. All rights reserved.
//

#import "CAGradientLayer+Additions.h"

@implementation CAGradientLayer (Additions)

+ (instancetype)verticalGradientLayerWithFrame:(CGRect)frame andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor
{
    CAGradientLayer *shadowGradientLayer = [self commanWithFrame:frame andStartColor:startColor andEndColor:endColor];
    shadowGradientLayer.startPoint = CGPointMake(.5, 0);
    shadowGradientLayer.endPoint = CGPointMake(.5, 1);
    return shadowGradientLayer;
}

+ (instancetype)horizontalGradientLayerWithFrame:(CGRect)frame andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor
{

    CAGradientLayer *shadowGradientLayer = [self commanWithFrame:frame andStartColor:startColor andEndColor:endColor];
    shadowGradientLayer.startPoint = CGPointMake(0, .5);
    shadowGradientLayer.endPoint = CGPointMake(1, .5);
    return shadowGradientLayer;
}

+ (instancetype)commanWithFrame:(CGRect)frame andStartColor:(UIColor *)startColor andEndColor:(UIColor *)endColor
{
    CAGradientLayer *shadowGradientLayer = [[CAGradientLayer alloc] init];
    shadowGradientLayer.frame = frame;
    shadowGradientLayer.colors = @[ (__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor ];
    shadowGradientLayer.locations = @[ @(0), @(1) ];
    return shadowGradientLayer;
}

@end
