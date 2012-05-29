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
        CGColorRef redColor = CGColorCreateFromNSColor (colorSpace, [NSColor redColor]);
        CGColorRef blackColor = CGColorCreateFromNSColor(colorSpace, [NSColor blackColor]);
        [self.layer setBorderColor: redColor];
        [self.layer setBorderWidth:5.0f];
        [self.layer setBackgroundColor: blackColor];
        CGColorSpaceRelease (colorSpace);
        CGColorRelease (redColor);   
        CGColorRelease(blackColor);
    //--------------------------------------------------------------------------------------------
        CGColorSpaceRef catColorSpace = CGColorSpaceCreateDeviceRGB ();
        CGColorRef catColor = CGColorCreateFromNSColor (colorSpace, [NSColor blackColor]);  
         CGColorSpaceRelease (catColorSpace);
         CGColorRelease (catColor);  
    //--------------------------------------------------------------------------------------------
        // Doesn't work because of NSWindow saying [self setIgnoresMouseEvents:TRUE];
        NSTrackingArea *trackingArea = [[NSTrackingArea alloc]initWithRect:[self frame] options:NSTrackingActiveAlways | NSTrackingMouseMoved owner:self userInfo:nil];
        [self addTrackingArea:trackingArea];
    }

    return self;
}



@end
