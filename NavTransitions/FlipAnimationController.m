//
//  FlipAnimationController.m
//  NavTransitions
//
//  Created by dasmer on 10/19/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import "FlipAnimationController.h"

@implementation FlipAnimationController
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //get references to the to and from view controllers  **BOILERPLATE
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //get a reference to the final frame of the toViewController **BOILERPLATE
    CGRect finalFrame  = [transitionContext finalFrameForViewController:toViewController];
    
    //get a reference to the transtion context's container view (where the animation actually happens) **BOILERPLATE
    UIView *containerView = [transitionContext containerView];
    
    //add the toViewController to the transition context's container view **BOILERPLATE
    [containerView addSubview:toViewController.view];
    
    //Customizations Below...
    
    // Give both VCs the same start frame
    fromViewController.view.frame = finalFrame;
    toViewController.view.frame = finalFrame;
   
    //if reverse initially flip clockwise otherwise flip counterclockwise
    float factor = self.reverse ? 1.0 : -1.0;
    toViewController.view.layer.transform = [self yRotation:factor * -M_PI_2];
   
  
     //Animate
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0.0
                                 options:0 animations:^{
                                     //flip the fromVC over the y-axis for the first 50% of the animation so it cant be seen
                                     [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5
                                                                   animations:^{
                                                                       fromViewController.view.layer.transform = [self yRotation:factor * M_PI_2];
                                                                   }];
                                     //flip the toVC to face user so it can be seen
                                     [UIView addKeyframeWithRelativeStartTime:0.5
                                                             relativeDuration:0.5 animations:^{

                                                                 toViewController.view.layer.transform =
                                                                 [self yRotation:0.0];
                                                             }];
                                 } completion:^(BOOL finished) {
                                     [transitionContext completeTransition: ![transitionContext transitionWasCancelled]];
                                 }];
 
}


// creates a rotation on the y-axis
- (CATransform3D) yRotation:(CGFloat) angle {
    return CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0);
}

@end
