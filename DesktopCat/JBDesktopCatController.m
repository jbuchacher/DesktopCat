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

@synthesize kittyContainerWindow = _kittyContainerWindow;
@synthesize desktopCat = _desktopCat;

- (id) init
{
    if (self = [super init])
    {

    }
    return self;
}

- (void) startRightMeow
{
    
    NSRect mainScreenRect = [[NSScreen mainScreen] frame];
    NSRect kittyRect = NSMakeRect(0.0, 0.0, mainScreenRect.size.width, 100.0);
    _kittyContainerWindow = [[JBDesktopCatContainerWindow alloc]initWithContentRect: kittyRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:YES];
    _desktopCat = [[JBDesktopCat alloc]initWithFrame: kittyRect];
    [_kittyContainerWindow setContentView: _desktopCat];
    [_kittyContainerWindow makeKeyAndOrderFront: nil];
        
    [self performSelector:@selector(setExpectationForCatToWalkRight)];
    
}

// Animation, expectations of movement of cat (they don't take orders.)

- (void) setExpectationForCatToWalkRight
{

//    NSDictionary *animations = [NSDictionary dictionaryWithObject: [self desktopCatWalkingNormal] forKey:@"frameOrigin"];
//    [_desktopCat.tempCatView setAnimations: animations];
//    NSPoint newOrigin = NSMakePoint((_desktopCat.tempCatView.frame.origin.x + 200), _desktopCat.tempCatView.frame.origin.y);
//    [_desktopCat.tempCatView.animator setFrameOrigin: newOrigin];
    
    NSRect mainScreenRect = [[NSScreen mainScreen] frame];
    CABasicAnimation *theAnimation;
    
    // create the animation object, specifying the position property as the key path
    // the key path is relative to the target animation object (in this case a CALayer)
    theAnimation=[CABasicAnimation animationWithKeyPath:@"position"];
    // set the fromValue and toValue to the appropriate points
    theAnimation.fromValue=[NSValue valueWithPoint:NSMakePoint(_desktopCat.tempCatView.frame.origin.x, _desktopCat.tempCatView.frame.origin.y)];
    theAnimation.toValue=[NSValue valueWithPoint:NSMakePoint((_desktopCat.tempCatView.frame.origin.x + mainScreenRect.size.width), _desktopCat.tempCatView.frame.origin.y)];
    // set the duration to 3.0 seconds
    theAnimation.duration=3.0;
    // set a custom timing function
    theAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    theAnimation.repeatCount = 5.0;
    [_desktopCat.tempCatView.layer addAnimation:theAnimation forKey:@"position"];

}

- (void) setExpectationForCatToWalkLeft
{
    
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



@end
