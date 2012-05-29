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
@synthesize statusBarItem, statusBarMenu, settingsController;

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
    
    NSMenuItem *debugMenuItem = [[NSMenuItem alloc] initWithTitle:@"Debugging" action: nil keyEquivalent:@""];
    NSMenu *debugMenu = [[NSMenu alloc] init];
    
    [debugMenu addItemWithTitle:@"Walk" action:@selector(toggleDebugAction:) keyEquivalent:@""];
    [debugMenu addItemWithTitle:@"Jump" action:@selector(toggleDebugAction:) keyEquivalent:@""];
    
    [statusBarMenu addItem: debugMenuItem];
    [statusBarMenu setSubmenu: debugMenu forItem: debugMenuItem];
    
    NSArray *menuItemLabels = [NSArray arrayWithObjects:@"Settings", @"Quit", nil];
    
    for (NSString *label in menuItemLabels)
    {
        NSString *selectorName = [NSString stringWithFormat:@"toggle%@", label];
        SEL theSelector = NSSelectorFromString(selectorName);
        [statusBarMenu addItemWithTitle: label action: theSelector keyEquivalent: @""];
    }
}

- (void) toggleDebugAction:(id)debugAction
{
    NSMenuItem *clickedMenuItem = (NSMenuItem *)debugAction;
    
    if ([clickedMenuItem.title isEqualToString:@"Walk"])
    {
        [_kittyController askCatToWalk];
    }
    else if ([clickedMenuItem.title isEqualToString:@"Jump"])
    {
        [_kittyController askCatToJump];
    }
}

// Menu item selectors
- (void) toggleSettings
{
    if (settingsController == nil)
    {
        settingsController = [[JBDesktopCatSettingsController alloc] init];
    }
    
    if (settingsController.isDisplayingSettings == NO)
    {
        [settingsController displaySettings];
    }
    else 
    {
        [settingsController dismissAndSaveSettings];
    }
}

- (void) toggleQuit
{
    // Does this always work?
    [NSApp stop: self];
}

@end
