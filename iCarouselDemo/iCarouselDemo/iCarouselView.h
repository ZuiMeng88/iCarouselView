//
//  iCarouselView.h
//  iCarouselDemo
//
//  Created by xiao on 2017/3/30.
//  Copyright © 2017年 xiao. All rights reserved.
//

#import "iCarousel.h"

@interface iCarouselView : iCarousel

@property (nonatomic, assign) BOOL isAutoScroll;

@property (nonatomic, strong) NSTimer *sutoScroll;


- (void)removeTimer;



@end
