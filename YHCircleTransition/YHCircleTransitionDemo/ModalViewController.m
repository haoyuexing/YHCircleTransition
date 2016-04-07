//
//  ModalViewController.m
//  YHCircleTransitionDemo
//
//  Created by HaoYoson on 16/4/8.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import "CAGradientLayer+Additions.h"
#import "ModalViewController.h"

#define kColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view.layer addSublayer:[CAGradientLayer verticalGradientLayerWithFrame:self.view.frame andStartColor:kColorFromRGB(0xf7e8af) andEndColor:kColorFromRGB(0x70e0f6)]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
