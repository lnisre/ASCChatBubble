//
//  ASCTextBlock.m
//  ASCChatBubble
//
//  Created by wenlonggao on 14-3-4.
//  Copyright (c) 2014年 wenlonggao. All rights reserved.
//

#import "ASCTextBlock.h"
#import "ASCNineImage.h"

#define MaxWidh 99999.0f
#define MaxHeight 99999.0f
#define HeadIndent 20.0f
#define TopIndent 5.0f

@interface ASCTextBlock ()
{
    ASCNineImage* backgroundImage;
    BOOL bLeft_;
    NSRect backGround_;
}
@property (assign, nonatomic) BOOL bLeft;
@property (assign, nonatomic) NSRect backGround;
@end

@implementation ASCTextBlock

@synthesize bLeft = bLeft_;
@synthesize backGround = backGround_;

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


-(NSRect)rectForLayoutAtPoint:(NSPoint)startingPoint inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
    NSRect result = [super rectForLayoutAtPoint:startingPoint inRect:rect textContainer:textContainer characterRange:charRange];
    
    NSString* string = [[[[textContainer textView] textStorage] attributedSubstringFromRange:charRange] string];
    NSLayoutManager* layout = [[NSLayoutManager alloc] init];
    NSTextContainer* container = [[NSTextContainer alloc] initWithContainerSize:rect.size];
    NSTextStorage* storage = [[NSTextStorage alloc] initWithString:string attributes:@{NSFontAttributeName : [NSFont systemFontOfSize:13]}];
    [layout addTextContainer:container];
    [storage addLayoutManager:layout];
    
    (void)[layout glyphRangeForTextContainer:container];
    NSRect temp = [layout usedRectForTextContainer:container];
    NSUInteger delta = 0;
    if (self.bLeft != YES) {
        delta = rect.size.width - temp.size.width;
    }
    result = NSMakeRect(startingPoint.x + delta , startingPoint.y, temp.size.width, temp.size.height);
    
    self.backGround = result;
    
    result.origin.x = self.bLeft ? result.origin.x+HeadIndent : result.origin.x+HeadIndent;
    result.origin.y += TopIndent;
    result.size.width -= 2*HeadIndent;
    return result;
}

-(void)drawBackgroundWithFrame:(NSRect)frameRect inView:(NSView *)controlView characterRange:(NSRange)charRange layoutManager:(NSLayoutManager *)layoutManager
{
    [backgroundImage drawInRect:self.backGround compositionOperation:NSCompositeDestinationAtop alphaFraction:1.0 flipped:YES];
}
@end
