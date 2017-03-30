//
//  iCarouselView.m
//  iCarouselDemo
//
//  Created by xiao on 2017/3/30.
//  Copyright © 2017年 xiao. All rights reserved.
//

#import "iCarouselView.h"

@implementation iCarouselView

- (void)setIsAutoScroll:(BOOL)isAutoScroll{

    _isAutoScroll = isAutoScroll;
    
    if (_isAutoScroll) {
        [self addTimer];
    }
}

-(void)addTimer
{
    self.sutoScroll = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                  target:self
                                                selector:@selector(nextImage)
                                                userInfo:nil
                                                 repeats:YES];
    //添加到runloop中
    [[NSRunLoop mainRunLoop]addTimer:self.sutoScroll
                             forMode:NSRunLoopCommonModes];
}

- (void)removeTimer;
{
    [self.sutoScroll invalidate];
    self.sutoScroll = nil;
}

- (void)nextImage{

    NSInteger index = self.currentItemIndex + 1;
    if (index == self.numberOfItems ) {
        index = 0;
    }
    [self scrollToItemAtIndex:index
                              animated:YES];

}



@end
