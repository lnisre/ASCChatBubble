//
//  ASCTextBlock.m
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-4.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import "ASCTextBlock.h"
#import "ASCNineImage.h"

@interface ASCTextBlock ()
{
    ASCNineImage* backgroundImage;
    BOOL bLeft_;
}
@property (assign, nonatomic) BOOL bLeft;
@end

@implementation ASCTextBlock

-(id)initWithAligment:(BOOL)left
{
    self = [super init];
    
    if (backgroundImage == nil) {
        self.bLeft = left;
        NSImage* baseImage = nil;
        if (left) {
            baseImage = [NSImage imageNamed:@"bubbleSomeone"];
        }else {
            
            baseImage = [NSImage imageNamed:@"bubbleMine"];
        }
        backgroundImage = [[ASCNineImage alloc] initWithImage:baseImage];
        
    }
    
    return self;
}


-(void)drawBackgroundWithFrame:(NSRect)frameRect inView:(NSView *)controlView characterRange:(NSRange)charRange layoutManager:(NSLayoutManager *)layoutManager
{
    [backgroundImage drawInRect:frameRect compositionOperation:NSCompositeDestinationAtop alphaFraction:1.0 flipped:YES];
}
@end
