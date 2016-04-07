//
//  LazyViewController.m
//  YHCircleTransitionDemo
//
//  Created by HaoYoson on 16/4/8.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import "LazyViewController.h"
#import "ModalViewController.h"
#import "YHCircleTransitionDelegate.h"

@interface LazyViewController ()

@end

@implementation LazyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ModalViewController *vc = [[ModalViewController alloc] init];
    vc.transitioningDelegate = [YHCircleTransitionDelegate sharedTransitionDelegate];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
