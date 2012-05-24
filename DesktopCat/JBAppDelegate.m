//
//  JBAppDelegate.m
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/14/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import "JBAppDelegate.h"

@implementation JBAppDelegate

@synthesize kittyController = _kittyController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    _kittyController = [[JBDesktopCatController alloc]init];
    [_kittyController startRightMeow];
    
}

@end
