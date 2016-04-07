//
//  CustomViewController.m
//  YHCircleTransitionDemo
//
//  Created by HaoYoson on 16/4/8.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import "CustomViewController.h"
#import "ModalViewController.h"
#import "YHCircleTransition.h"

@interface CustomViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation CustomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ModalViewController *vc = [[ModalViewController alloc] init];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{

    YHCircleTransition *presentingTransition = [YHCircleTransition transitionWithMode:YHCircleTransitionModePresenting];
    presentingTransition.transitionDuration = 2;
    presentingTransition.transitionCenter = [self randomScreenPoint];
    return presentingTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    YHCircleTransition *dismissingTransition = [YHCircleTransition transitionWithMode:YHCircleTransitionModeDismissing];
    dismissingTransition.transitionDuration = 1;
    dismissingTransition.transitionCenter = [self randomScreenPoint];
    return dismissingTransition;
}

- (CGPoint)randomScreenPoint
{
    return CGPointMake((arc4random() % (int)[UIScreen mainScreen].bounds.size.width * 10) * 0.1, (arc4random() % (int)[UIScreen mainScreen].bounds.size.height * 10) * 0.1);
}

@end
