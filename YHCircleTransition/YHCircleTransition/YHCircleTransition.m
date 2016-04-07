//
//  YHCircleTransition.m
//  YHCircleTransitionDemo
//
//  Created by HaoYoson on 16/4/8.
//  Copyright © 2016年 YosonHao. All rights reserved.
//

#import "YHCircleTransition.h"

@interface YHCircleTransition ()

@property (weak, nonatomic) id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation YHCircleTransition

+ (instancetype)transitionWithMode:(YHCircleTransitionMode)mode
{
    YHCircleTransition *transition = [[YHCircleTransition alloc] init];
    transition.transitionMode = mode;
    return transition;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.transitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{

    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;

    [transitionContext.containerView addSubview:toView];

    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.height;
    CGFloat radius = sqrt(screenHeight * screenHeight + screenWidth * screenWidth);

    CGRect circleMaskOvalInitial = CGRectMake(self.transitionCenter.x, self.transitionCenter.y, 0, 0);
    UIBezierPath *circleMaskPathInitial
        = [UIBezierPath bezierPathWithOvalInRect:circleMaskOvalInitial];
    UIBezierPath *circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(circleMaskOvalInitial, -radius, -radius)];

    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.duration = self.transitionDuration;
    maskLayerAnimation.delegate = self;
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskLayerAnimation.fillMode = kCAFillModeForwards;
    maskLayerAnimation.removedOnCompletion = NO;

    CAShapeLayer *maskLayer = [CAShapeLayer layer];

    switch (self.transitionMode) {
    case YHCircleTransitionModePresenting:
        maskLayerAnimation.fromValue = (__bridge id _Nullable)(circleMaskPathInitial.CGPath);
        maskLayerAnimation.toValue = (__bridge id _Nullable)(circleMaskPathFinal.CGPath);
        toView.layer.mask = maskLayer;

        break;
    case YHCircleTransitionModeDismissing:
        maskLayerAnimation.fromValue = (__bridge id _Nullable)(circleMaskPathFinal.CGPath);
        maskLayerAnimation.toValue = (__bridge id _Nullable)(circleMaskPathInitial.CGPath);
        fromView.layer.mask = maskLayer;

        [transitionContext.containerView bringSubviewToFront:fromView];
        break;
    default:
        break;
    }

    [maskLayer addAnimation:maskLayerAnimation forKey:@"YHCircleTransition"];

    self.transitionContext = transitionContext;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        [self.transitionContext completeTransition:YES];
    }
}

- (CGPoint)transitionCenter
{
    if (_transitionCenter.x == 0 && _transitionCenter.y == 0) {
        return CGPointZero;
    }
    return _transitionCenter;
}

- (NSTimeInterval)transitionDuration
{
    if (!_transitionDuration) {
        _transitionDuration = .25;
    }
    return _transitionDuration;
}

@end
