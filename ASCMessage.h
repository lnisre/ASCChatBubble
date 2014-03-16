//
//  ASCMessage.h
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-5.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kASCMessageText @"asc.message.text"
#define kASCMessageImage @"asc.message.image"
#define kASCMessageFile @"asc.message.file"


@interface ASCMessage : NSObject

@property(assign, readwrite) BOOL sendbySelf;
@property(assign, readwrite) UInt64 msgId;
@property(assign, readwrite) NSString* senderName;
@property(assign, readwrite) NSArray* context;


-(id)initWithMsgId:(UInt64)Id sender:(NSString*)sender context:(NSArray*)context FromSelf:(BOOL)fromSelf;

@end
