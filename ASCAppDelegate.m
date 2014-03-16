//
//  ASCAppDelegate.m
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-3.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import "ASCAppDelegate.h"
#import "ASCWindowController.h"


@implementation ASCAppDelegate
{
    ASCWindowController* windowController_;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [_window.windowController hide:_window];
    
    if (windowController_ == nil) {
        windowController_ = [[ASCWindowController alloc] initWithWindowNibName:@"ASCWindowController"];
        [windowController_.window center];
        [windowController_ showWindow:windowController_.window];
    }
}

@end
