//
//  ASCMessage+NSAttributeStringExtension.h
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-5.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//
#import "ASCMessage.h"


@interface ASCMessage (NSAttributeStringExtension)

-(NSAttributedString*)attributeStringWithOwner:(NSTextView*)owner;

@end
