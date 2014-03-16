//
//  ASCWindowController.m
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-3.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import "ASCWindowController.h"
#import "ASCMessage.h"
#import "ASCMessage+NSAttributeStringExtension.h"

@interface ASCWindowController ()

@end

@implementation ASCWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
}

-(IBAction)addBubble:(id)sender
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:[NSArray arrayWithObjects:kASCMessageText, @"hello", nil]];
//    [arr addObject:[NSArray arrayWithObjects:kASCMessageImage, @"/Users/wenlonggao/Desktop/ASCChatBubble/ASCChatBubble/images/bubbleSomeone.png", nil]];
    
    ASCMessage *msg = [[ASCMessage alloc] initWithMsgId:0 sender:@"他" context:arr FromSelf:NO];
    NSAttributedString* string = [msg attributeStringWithOwner:self.txtView];
    NSTextStorage *storage = [self.txtView textStorage];
    [storage appendAttributedString:string];
    
}

-(IBAction)addBuble2:(id)sender
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:[NSArray arrayWithObjects:kASCMessageText, @"hello", nil]];
    [arr addObject:[NSArray arrayWithObjects:kASCMessageImage, @"/Users/wenlonggao/Desktop/typingMine.png", nil]];
    
    ASCMessage *msg = [[ASCMessage alloc] initWithMsgId:0 sender:@"我" context:arr FromSelf:YES];
    NSAttributedString* string = [msg attributeStringWithOwner:self.txtView];
    NSTextStorage *storage = [self.txtView textStorage];
    [storage appendAttributedString:string];

}

@end
