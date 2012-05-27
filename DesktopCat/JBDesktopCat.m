//
//  JBDesktopCat.m
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/14/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import "JBDesktopCat.h"
#import <Quartz/Quartz.h>

@implementation JBDesktopCat
@synthesize tempCatView;

static CGColorRef CGColorCreateFromNSColor (CGColorSpaceRef
                                            colorSpace, NSColor *color)
{
    NSColor *deviceColor = [color colorUsingColorSpaceName:
                            NSDeviceRGBColorSpace];
    CGFloat components[4];
    [deviceColor getRed: &components[0] green: &components[1] blue:
     &components[2] alpha: &components[3]];
    return CGColorCreate (colorSpace, components);
}

- (id) initWithFrame:(NSRect)frameRect
{
    if (self = [super initWithFrame:frameRect])
    {
        [self setWantsLayer:TRUE];
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB ();
        CGColorRef cgColor = CGColorCreateFromNSColor (colorSpace, [NSColor redColor]);        
        [self.layer setBorderColor: cgColor];
        [self.layer setBorderWidth:2.0f];
        CGColorSpaceRelease (colorSpace);
        CGColorRelease (cgColor);        
    //--------------------------------------------------------------------------------------------
        NSRect tempCatRect = NSInsetRect(NSMakeRect(frameRect.origin.x, frameRect.origin.y, 100.0, 100.0), 5.0, 5.0);
        tempCatView = [[NSView alloc]initWithFrame: tempCatRect];
        CGColorSpaceRef catColorSpace = CGColorSpaceCreateDeviceRGB ();
        CGColorRef catColor = CGColorCreateFromNSColor (colorSpace, [NSColor blackColor]);  
        [tempCatView setWantsLayer:TRUE];
        [tempCatView.layer setBackgroundColor:catColor];
         CGColorSpaceRelease (catColorSpace);
         CGColorRelease (catColor);  
        [self addSubview: tempCatView];
    //--------------------------------------------------------------------------------------------
        // Doesn't work because of NSWindow saying [self setIgnoresMouseEvents:TRUE];
        NSTrackingArea *trackingArea = [[NSTrackingArea alloc]initWithRect:[self frame] options:NSTrackingActiveAlways | NSTrackingMouseMoved owner:self userInfo:nil];
        [self addTrackingArea:trackingArea];
        
    }

    return self;
}



@end
