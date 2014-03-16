//
//  ASCMessage.m
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-5.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import "ASCMessage.h"

@implementation ASCMessage

-(id)initWithMsgId:(UInt64)Id sender:(NSString *)sender context:(NSArray *)context FromSelf:(BOOL)fromSelf
{
    self.msgId = Id;
    self.senderName = sender;
    self.context = context;
    self.sendbySelf = fromSelf;
    return self;
}

@end
