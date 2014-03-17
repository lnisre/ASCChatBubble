//
//  ASCTextAligment.m
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-4.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import "ASCTextAligment.h"
#import "ASCTextBlock.h"

#define LeftInlineBorder 1.0f
#define TextBlockPadding 8.0f
#define TextBlockWithPercent 100.0f
#define TextBlockWith 80.0f

#define SendColor [NSColor colorWithCalibratedRed:225 green:0 blue:0 alpha:1]

@implementation ASCTextAligment

+(NSDictionary *)leftAligment
{
    ASCTextBlock *block = [[ASCTextBlock alloc] initWithAligment:YES];
    [block setWidth:TextBlockPadding type:NSTextBlockAbsoluteValueType forLayer:NSTextBlockPadding edge:0];
    [block setWidth:TextBlockWith type:NSTextBlockAbsoluteValueType forLayer:NSTextBlockWidth];
    [block setContentWidth:TextBlockWithPercent type:NSTextBlockPercentageValueType];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraph setTextBlocks:[NSArray arrayWithObjects:block, nil]];
    [paragraph setAlignment:NSLeftTextAlignment];
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   paragraph, NSParagraphStyleAttributeName, nil];
    return result;
}

+(NSDictionary *)rightAligment
{
    ASCTextBlock *block = [[ASCTextBlock alloc] initWithAligment:NO];
    [block setWidth:TextBlockPadding type:NSTextBlockAbsoluteValueType forLayer:NSTextBlockPadding edge:0];
    [block setWidth:TextBlockWith type:NSTextBlockAbsoluteValueType forLayer:NSTextBlockWidth];
    [block setContentWidth:TextBlockWithPercent type:NSTextBlockPercentageValueType];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    [paragraph setTextBlocks:[NSArray arrayWithObjects:block, nil]];
    [paragraph setAlignment:NSRightTextAlignment];
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                   paragraph, NSParagraphStyleAttributeName, nil];
    
    return result;
}

+(NSDictionary *)leftSenderAligment
{
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    [paragraph setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraph setAlignment:NSLeftTextAlignment];
    
    NSDictionary *result = [[NSDictionary alloc] initWithObjectsAndKeys:
                            SendColor, NSForegroundColorAttributeName,
                            paragraph, NSParagraphStyleAttributeName, nil];
    return result;
}

+(NSDictionary *)rightSenderAligment
{
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    [paragraph setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraph setAlignment:NSRightTextAlignment];
    
    NSDictionary *result = [[NSDictionary alloc] initWithObjectsAndKeys:
                            SendColor, NSForegroundColorAttributeName,
                            paragraph, NSParagraphStyleAttributeName, nil];
    return result;
}

+(NSAttributedString *)LineBreak
{
    NSAttributedString *result = [[NSAttributedString alloc] initWithString:@"\n"];
    return result;
}

@end
