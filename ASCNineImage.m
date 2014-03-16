//
//  ASCNineImage.m
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-12.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import "ASCNineImage.h"

@implementation ASCNineImage
{
    NSImage* baseImage;
    
    NSImage* leftTopImage;
    NSImage* rightTopImage;
    NSImage* leftImage;
    NSImage* topImage;
    NSImage* rightImage;
    NSImage* leftBottomImage;
    NSImage* rightBottomImage;
    NSImage* bottomImage;
    NSImage* fillImage;
    
    NSRect leftTopRect;
    NSRect rightTopRect;
    NSRect leftRect;
    NSRect topRect;
    NSRect rightRect;
    NSRect leftBottomRect;
    NSRect rightBottomRect;
    NSRect bottomRect;
    NSRect fillRect;
}

-(id)initWithImage:(NSImage *)image
{
    self = [super init];
    
    baseImage = image;
    CGFloat CapWidth = floor(baseImage.size.width/2 - 1);
    CGFloat CapHeight = floor(baseImage.size.height/2 - 1);
    
    leftTopRect = NSMakeRect(0, baseImage.size.height-CapHeight, CapWidth, CapHeight);
    leftTopImage = [[NSImage alloc] initWithSize:leftTopRect.size];
    [leftTopImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, leftTopRect.size.width, leftTopRect.size.height) fromRect:leftTopRect operation:NSCompositeCopy fraction:1.0];
    [leftTopImage unlockFocus];
    
    rightTopRect = NSMakeRect(baseImage.size.width-CapWidth, baseImage.size.height-CapHeight, CapWidth, CapHeight);
    rightTopImage = [[NSImage alloc] initWithSize:rightTopRect.size];
    [rightTopImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, rightTopRect.size.width, rightTopRect.size.height) fromRect:rightTopRect operation:NSCompositeCopy fraction:1.0];
    [rightTopImage unlockFocus];
    
    leftRect = NSMakeRect(0, CapHeight, CapWidth, baseImage.size.height-2*CapHeight);
    leftImage = [[NSImage alloc] initWithSize:leftRect.size];
    [leftImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, leftRect.size.width, leftRect.size.height) fromRect:leftRect operation:NSCompositeCopy fraction:1.0];
    [leftImage unlockFocus];
    
    topRect = NSMakeRect(CapWidth, baseImage.size.height-CapHeight, baseImage.size.width-2*CapWidth, CapHeight );
    topImage = [[NSImage alloc] initWithSize:topRect.size];
    [topImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, topRect.size.width, topRect.size.height) fromRect:topRect operation:NSCompositeCopy fraction:1.0];
    [topImage unlockFocus];
    
    rightRect = NSMakeRect(baseImage.size.width-CapWidth, CapHeight, CapWidth, baseImage.size.height-2*CapHeight);
    rightImage = [[NSImage alloc] initWithSize:rightRect.size];
    [rightImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, rightRect.size.width, rightRect.size.height) fromRect:rightRect operation:NSCompositeCopy fraction:1.0];
    [rightImage unlockFocus];
    
    leftBottomRect = NSMakeRect(0, 0, CapWidth, CapHeight);
    leftBottomImage = [[NSImage alloc] initWithSize:leftBottomRect.size];
    [leftBottomImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, leftBottomRect.size.width, leftBottomRect.size.height) fromRect:leftBottomRect operation:NSCompositeCopy fraction:1.0];
    [leftBottomImage unlockFocus];
    
    rightBottomRect = NSMakeRect(baseImage.size.width-CapWidth, 0, CapWidth, CapHeight);
    rightBottomImage = [[NSImage alloc] initWithSize:rightBottomRect.size];
    [rightBottomImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, rightBottomRect.size.width, rightBottomRect.size.height) fromRect:rightBottomRect operation:NSCompositeCopy fraction:1.0];
    [rightBottomImage unlockFocus];
    
    bottomRect = NSMakeRect(CapWidth, 0, baseImage.size.width-2*CapWidth, CapHeight);
    bottomImage = [[NSImage alloc] initWithSize:bottomRect.size];
    [bottomImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, bottomRect.size.width, bottomRect.size.height) fromRect:bottomRect operation:NSCompositeCopy fraction:1.0];
    [bottomImage unlockFocus];
    
    fillRect = NSMakeRect(CapWidth, CapHeight, baseImage.size.width-2*CapWidth, baseImage.size.width-2*CapHeight);
    fillImage = [[NSImage alloc] initWithSize:fillRect.size];
    [fillImage lockFocus];
    [baseImage drawInRect:NSMakeRect(0, 0, fillRect.size.width, fillRect.size.height) fromRect:fillRect operation:NSCompositeCopy fraction:1.0];
    [fillImage unlockFocus];
    
    return self;
}

-(void)drawInRect:(NSRect)dirtyRect compositionOperation:(NSCompositingOperation)op alphaFraction:(CGFloat)alpha flipped:(BOOL)flipped
{
    NSDrawNinePartImage(dirtyRect, leftTopImage, topImage, rightTopImage, leftImage, fillImage, rightImage, leftBottomImage, bottomImage, rightBottomImage, op, alpha, flipped);
    
}

@end
