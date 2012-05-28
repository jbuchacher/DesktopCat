//
//  JBDesktopCatSettingsController.h
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/27/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JBDesktopCatSettingsWindow.h"
#import "JBDesktopCatSettingsView.h"

@interface JBDesktopCatSettingsController : NSObject

@property (strong, nonatomic) JBDesktopCatSettingsWindow *settingsWindow;
@property (strong, nonatomic) JBDesktopCatSettingsView *settingsView;

@property (assign) BOOL isDisplayingSettings;

- (void) displaySettings;
- (void) dismissAndSaveSettings;


@end
