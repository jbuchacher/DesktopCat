//
//  JBDesktopCatSettingsWindow.m
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/27/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import "JBDesktopCatSettingsWindow.h"

@implementation JBDesktopCatSettingsWindow

- (id)initWithContentRect:(NSRect)contentRect
                styleMask:(NSUInteger)aStyle
                  backing:(NSBackingStoreType)bufferingType
                    defer:(BOOL)flag {
    // Using NSBorderlessWindowMask results in a window without a title bar.
    self = [super initWithContentRect:contentRect styleMask: aStyle backing: bufferingType defer: flag];
    if (self != nil) {
        // Start with no transparency for all drawing into the window
        [self setAlphaValue:1.0];
        // Turn off opacity so that the parts of the window that are not drawn into are transparent.
        [self setOpaque:NO];
        // Make kitty cat on top of all the less interesting stuff
        [self setLevel:(CGWindowLevelForKey(kCGOverlayWindowLevelKey))];
        // Make container window background transparent.
    }    
    
    return self;
}

- (BOOL)canBecomeKeyWindow 
{
    return YES;
}

- (BOOL)isMovableByWindowBackground
{
    return YES;
}

@end
