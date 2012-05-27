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
@synthesize theMenu, theMenuItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    _kittyController = [[JBDesktopCatController alloc]init];
    [_kittyController startRightMeow];
    
}

- (void)awakeFromNib
{
    theMenuItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [theMenuItem setMenu: theMenu];
    [theMenuItem setHighlightMode:TRUE];
    [theMenuItem setImage:[NSImage imageNamed:@"menu_icon.png"]];
//    [theMenuItem setTitle:@"title"];
}

@end
