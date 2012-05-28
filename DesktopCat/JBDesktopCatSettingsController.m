//
//  JBDesktopCatSettingsController.m
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/27/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import "JBDesktopCatSettingsController.h"
#import "JBDesktopCatSettingsWindow.h"
#import "JBDesktopCatSettingsView.h"


@implementation JBDesktopCatSettingsController

- (void) displaySettings
{
    JBDesktopCatSettingsWindow *settingsWindow = [[JBDesktopCatSettingsWindow alloc] initWithContentRect:NSMakeRect(0.0, 0.0, 300, 300) styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];
    JBDesktopCatSettingsView *settingsView = [[JBDesktopCatSettingsView alloc] initWithFrame:NSMakeRect(0.0, 0.0, 300, 300)];
    [settingsWindow setContentView: settingsView];
    [settingsWindow makeKeyAndOrderFront: nil];
}

@end
