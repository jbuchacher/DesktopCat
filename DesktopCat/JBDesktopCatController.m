//
//  JBDesktopCatController.m
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/14/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import "JBDesktopCatController.h"
#import <Quartz/Quartz.h>

@interface JBDesktopCatController ()
@property (assign) BOOL catIsAnimating;
@property (assign) CGPoint catJumpStartPoint;
@end

@implementation JBDesktopCatController

@synthesize kittyContainerWindow = _kittyContainerWindow;
@synthesize desktopCat = _desktopCat;
@synthesize catIsAnimating;

@synthesize catJumpStartPoint;

- (id) init
{
    if (self = [super init])
    {
        catIsAnimating = FALSE;
    }
    return self;
}

- (void) startRightMeow
{
    //NSRect kittyRect = NSMakeRect(0.0, 0.0, 100.0, 100.0);
    NSRect kittyRect = [[NSScreen mainScreen] frame];
    _kittyContainerWindow = [[JBDesktopCatContainerWindow alloc]initWithContentRect: kittyRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer: NO];
    _desktopCat = [[JBDesktopCat alloc]initWithFrame: NSMakeRect(0.0, 0.0, 100.0, 100.0)];
    
    NSView *contentView = [[NSView alloc]initWithFrame: kittyRect];
    [contentView setWantsLayer:TRUE];
    [contentView addSubview: _desktopCat];
    [_kittyContainerWindow setContentView: contentView];
    
    [_kittyContainerWindow makeKeyAndOrderFront:nil];
    
    // [_kittyContainerWindow makeKeyAndOrderFront: nil];
        
    [self setExpectationForCatToJump];
        
    NSLog(@"Frame of Desktop Cat: %@\nFrame of Container Window: %@", NSStringFromRect(_desktopCat.frame), NSStringFromRect(_kittyContainerWindow.frame));
    
}

// Animation, expectations of movement of cat (they don't take orders.)

- (void) setExpectationForCatToWalkRight
{

//    NSDictionary *animations = [NSDictionary dictionaryWithObject: [self desktopCatWalkingNormal] forKey:@"frameOrigin"];
//    [_desktopCat.tempCatView setAnimations: animations];
//    NSPoint newOrigin = NSMakePoint((_desktopCat.tempCatView.frame.origin.x + 200), _desktopCat.tempCatView.frame.origin.y);
//    [_desktopCat.tempCatView.animator setFrameOrigin: newOrigin];
    
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    theAnimation.fromValue=[NSValue valueWithPoint:NSMakePoint(_desktopCat.tempCatView.frame.origin.x, _desktopCat.tempCatView.frame.origin.y)];
    theAnimation.toValue=[NSValue valueWithPoint:NSMakePoint((_desktopCat.tempCatView.frame.origin.x + _desktopCat.window.frame.size.width), _desktopCat.tempCatView.frame.origin.y)];
    theAnimation.duration = 0.5;
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    theAnimation.repeatCount = 2;
    theAnimation.delegate = self;
    theAnimation.autoreverses = TRUE;
    [self.desktopCat.tempCatView.layer addAnimation: theAnimation forKey:@"position"];
    
}

- (void) setExpectationForCatToWalkLeft
{
    
}

- (void) setExpectationForCatToJump
{
    
    catJumpStartPoint = _desktopCat.frame.origin;
    NSLog(@"Subviews: %@", [[_kittyContainerWindow contentView] subviews]);
    [_desktopCat.layer addAnimation: [self desktopCatJumping] forKey:@"desktopCatJumping"];

}

// Returned animations

- (CAKeyframeAnimation *) desktopCatWalkingNormal
{
        CAKeyframeAnimation *desktopCatWalkingNormal = [CAKeyframeAnimation animation];
        desktopCatWalkingNormal.duration = 4.0f;
        desktopCatWalkingNormal.values = [NSArray arrayWithObjects: [NSNumber numberWithFloat:0.0f], [NSNumber numberWithFloat:50.0f], [NSNumber numberWithFloat:100.0f], [NSNumber numberWithFloat:150.0f], [NSNumber numberWithFloat:200.0f], nil];
        desktopCatWalkingNormal.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
        desktopCatWalkingNormal.calculationMode = kCAAnimationLinear;   

    return desktopCatWalkingNormal;
}

- (CAKeyframeAnimation *) desktopCatTurningAround
{
    CAKeyframeAnimation *desktopCatTurningAround = [CAKeyframeAnimation animation];
    desktopCatTurningAround.duration = 1.0f;
    desktopCatTurningAround.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear];
    desktopCatTurningAround.calculationMode = kCAAnimationLinear;
    
    return desktopCatTurningAround;
}
     
- (CAKeyframeAnimation *) desktopCatJumping
{
    // Fancy jumping animation.
    NSRect catWindowFrame = [self.kittyContainerWindow frame];
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,15.0f,15.0f);
    CGPathAddCurveToPoint(thePath, NULL, 5.0f, 5.0f, 300.0, catWindowFrame.size.height - 100.0, 600, 5.0f);
    
    CAKeyframeAnimation *jumpAnimation;
    jumpAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // No keytimes/values necessary due to OS interpolating values based on CGPathRef
    jumpAnimation.duration = 1.0;
    jumpAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    jumpAnimation.repeatCount = 0;
    jumpAnimation.autoreverses = TRUE;
    jumpAnimation.delegate = self;
    jumpAnimation.path = thePath;
    
    CFRelease(thePath);
    
    return jumpAnimation;
}

- (void) animationDidStart:(CAAnimation *)anim
{
    NSLog(@"Cat started animating.");
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"Cat stopped animating.");
    if (catIsAnimating == FALSE)
    {
        [self setExpectationForCatToJump];
//        NSView *view = [_kittyContainerWindow contentView];
//        [view setWantsLayer:FALSE];
        catIsAnimating = TRUE;
    }
    
    
}


@end
