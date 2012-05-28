//
//  JBDesktopCatSettingsView.m
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/27/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import "JBDesktopCatSettingsView.h"

@implementation JBDesktopCatSettingsView

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor clearColor] set];
    NSRectFill([self frame]);
    
    [[NSColor blackColor] set];
    
    CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
    CGContextSetRGBFillColor(ctx, 1.0, 0.0, 0.0, 0.75);
    
    //CGRect catHeadRect = CGRectMake(0.0, 0.0, self.window.frame.size.width, self.window.frame.size.height);
    
    NSImage *img = [NSImage imageNamed:@"CatHeadComposite"];
    [img compositeToPoint:NSMakePoint(0.0, 0.0) operation:NSCompositeSourceOver];
    [self.window setHasShadow: NO];
    [self.window setHasShadow: YES];
    
}

@end
