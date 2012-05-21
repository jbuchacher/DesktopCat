//
//  JBAppDelegate.h
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/14/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JBDesktopCatController.h"

@interface JBAppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) JBDesktopCatController *kittyController;

@end
