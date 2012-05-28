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
@synthesize statusBarItem, statusBarMenu;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    _kittyController = [[JBDesktopCatController alloc]init];
    [_kittyController startRightMeow];
    
}

- (void)awakeFromNib
{
    [self setupAndLoadMenuItems];
}

- (void) setupAndLoadMenuItems
{
    statusBarItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusBarItem setMenu: statusBarMenu];
    [statusBarItem setHighlightMode:TRUE];
    [statusBarItem setImage:[NSImage imageNamed:@"menu_icon.png"]];
    
    NSArray *menuItemLabels = [NSArray arrayWithObjects:@"Settings", @"Quit", nil];
    
    for (NSString *label in menuItemLabels)
    {
        NSString *selectorName = [NSString stringWithFormat:@"toggle%@", label];
        SEL theSelector = NSSelectorFromString(selectorName);
        [statusBarMenu addItemWithTitle: label action: theSelector keyEquivalent: @""];
    }
}

// Menu item selectors
- (void) toggleSettings
{
    
}

- (void) toggleQuit
{
    // Does this always work?
    [NSApp stop: self];
}

@end
