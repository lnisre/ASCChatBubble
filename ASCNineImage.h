//
//  ASCNineImage.h
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-12.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ASCNineImage : NSObject

-(id)initWithImage:(NSImage*)image;

-(void)drawInRect:(NSRect)dirtyRect compositionOperation:(NSCompositingOperation)op alphaFraction:(CGFloat)alpha flipped:(BOOL)flipped;

@end
