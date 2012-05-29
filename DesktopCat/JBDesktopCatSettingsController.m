//
//  JBDesktopCatSettingsController.m
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/27/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import "JBDesktopCatSettingsController.h"
#import "JBDesktopCatSettingsView.h"


@implementation JBDesktopCatSettingsController
@synthesize settingsWindow;
@synthesize settingsView;
@synthesize isDisplayingSettings;

- (void) displaySettings
{
    settingsWindow = [[JBDesktopCatSettingsWindow alloc] initWithContentRect:NSMakeRect(0.0, 0.0, 500.0, 500.0) styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO];
    settingsView = [[JBDesktopCatSettingsView alloc] initWithFrame: [settingsWindow frame]];
    
    CGFloat xPos = NSWidth([[settingsWindow screen] frame])/2 - NSWidth([settingsWindow frame])/2;
    CGFloat yPos = NSHeight([[settingsWindow screen] frame])/2 - NSHeight([settingsWindow frame])/2;
    [settingsWindow setFrame:NSMakeRect(xPos, yPos, NSWidth([settingsWindow frame]), NSHeight([settingsWindow frame])) display:YES];
    
    [settingsWindow.contentView addSubview: settingsView];
    [settingsWindow makeKeyAndOrderFront: nil];
    self.isDisplayingSettings = YES;
    
    NSButton *closeButton = [[NSButton alloc]initWithFrame:NSMakeRect(0.0, 0.0, 25.0, 25.0)];
    [closeButton setTitle:@"X"];
    NSPoint closeButtonCenterPoint = NSMakePoint(410, 440);
    [closeButton setFrameOrigin: closeButtonCenterPoint];
    [closeButton setTarget: self];
    [closeButton setAction: @selector(dismissAndSaveSettings)];
    
    [self.settingsView addSubview: closeButton];
}

- (void) dismissAndSaveSettings
{
    [settingsWindow orderOut: nil];
    self.isDisplayingSettings = NO;
}

@end
