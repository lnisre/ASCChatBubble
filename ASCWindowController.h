//
//  ASCWindowController.h
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-3.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ASCWindowController : NSWindowController

@property(assign) IBOutlet NSTextView *txtView;


-(IBAction)addBubble:(id)sender;

-(IBAction)addBuble2:(id)sender;

@end
