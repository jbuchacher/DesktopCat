//
//  JBDesktopCatController.m
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/14/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import "JBDesktopCatController.h"
#import <Quartz/Quartz.h>

@implementation JBDesktopCatController

@synthesize kittyCatWindow = _kittyCatWindow;
@synthesize desktopCat = _desktopCat;

- (id) init
{
    if (self = [super init])
    {
        _kittyCatWindow = [JBDesktopCatContainerWindow catWindow];    // Get a cat container window.
        _desktopCat = [[JBDesktopCat alloc]initWithFrame: _kittyCatWindow.frame];
        [_desktopCat setWantsLayer:TRUE];
        [_desktopCat.layer setBackgroundColor: CGColorCreateGenericRGB(0.0, 0.0, 0.0, 1.0)];
        [_kittyCatWindow setContentView: _desktopCat];
    }
    return self;
}

- (void) enterCat
{
    [_kittyCatWindow makeKeyAndOrderFront: _kittyCatWindow];    // Display a cat
    [self setExpectationForCatToWalkRight];
}

// Animation, expectations of movement of cat (they don't take orders.)

- (void) setExpectationForCatToWalkRight
{

    NSDictionary *animations = [NSDictionary dictionaryWithObject: [self desktopCatWalkingNormal] forKey:@"frameOrigin"];
    [_desktopCat setAnimations: animations];
    NSPoint newOrigin = NSMakePoint((_desktopCat.frame.origin.x + 200), 0.0);
    [_desktopCat.animator setFrameOrigin: newOrigin];
}

- (void) setExpectationForCatToWalkLeft
{
    
}

// Returned animations

- (CAKeyframeAnimation *) desktopCatWalkingNormal
{
        CAKeyframeAnimation *desktopCatWalkingNormal = [CAKeyframeAnimation animation];
        desktopCatWalkingNormal.duration = 5.0f;
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



@end
