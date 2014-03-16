//
//  ASCTextAligment.h
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-4.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASCTextAligment : NSObject

+(NSDictionary*)leftAligment;
+(NSDictionary*)rightAligment;

+(NSAttributedString*)LineBreak;

+(NSDictionary*)leftSenderAligment;
+(NSDictionary*)rightSenderAligment;

@end
