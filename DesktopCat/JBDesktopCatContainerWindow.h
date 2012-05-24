//
//  JBDesktopCatContainerWindow.h
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/14/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JBDesktopCat.h"

@interface JBDesktopCatContainerWindow : NSWindow

@property (strong, nonatomic) JBDesktopCat *desktopCat;

@end
