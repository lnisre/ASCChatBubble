//
//  ASCMessage+NSAttributeStringExtension.m
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-5.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import "ASCMessage+NSAttributeStringExtension.h"
#import "ASCTextAligment.h"

@implementation ASCMessage (NSAttributeStringExtension)

-(NSAttributedString *)attributeStringWithOwner:(NSTextView *)owner
{
    NSMutableAttributedString* result = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString* sender = [[NSAttributedString alloc] initWithString:self.senderName attributes:self.sendbySelf ? [ASCTextAligment rightSenderAligment] : [ASCTextAligment leftSenderAligment]];
    [result appendAttributedString:sender];
    [result appendAttributedString:[ASCTextAligment LineBreak]];
    
    NSMutableAttributedString* context = [[NSMutableAttributedString alloc] init];
    
    for (id item in self.context) {
        if ([item[0] isEqualToString:kASCMessageText]) {
            NSAttributedString* text = [[NSAttributedString alloc] initWithString:item[1]];
            [context appendAttributedString:text];
        }else if ([item[0] isEqualToString:kASCMessageImage]) {
            // 添加图片
            NSString* imagePath = item[1];
            NSImage* image = [[NSImage alloc] initWithContentsOfFile:imagePath];
            NSTextAttachmentCell* cell = [[NSTextAttachmentCell alloc] initImageCell:image];
            NSTextAttachment* attachemnt = [[NSTextAttachment alloc] init];
            [attachemnt setAttachmentCell:cell];
            NSFileWrapper* fileWrapper = [[NSFileWrapper alloc] init];
            [fileWrapper setIcon:image];
            [fileWrapper setFilename:imagePath];
            [fileWrapper setPreferredFilename:imagePath];
            [attachemnt setFileWrapper:fileWrapper];
            
            NSAttributedString* string = [NSAttributedString attributedStringWithAttachment:attachemnt];
            [context appendAttributedString:string];
        }
    }
    [context setAttributes:self.sendbySelf ? [ASCTextAligment rightAligment] : [ASCTextAligment leftAligment] range:NSMakeRange(0, context.length)];
    [result appendAttributedString:context];
    [result appendAttributedString:[ASCTextAligment LineBreak]];
    
    return result;
}

@end
