//
//  JBDesktopCatController.h
//  DesktopCat
//
//  Created by Joshua Buchacher on 5/14/12.
//  Copyright (c) 2012 Joshua Buchacher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>
#import "JBDesktopCatContainerWindow.h"
#import "JBDesktopCat.h"

@interface JBDesktopCatController : NSObject

@property (strong, nonatomic) JBDesktopCatContainerWindow *kittyCatWindow;
@property (strong, nonatomic) JBDesktopCat *desktopCat;

- (void) enterCat;

@end