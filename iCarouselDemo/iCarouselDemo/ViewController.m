//
//  ViewController.m
//  iCarouselDemo
//
//  Created by xiao on 2017/3/30.
//  Copyright © 2017年 xiao. All rights reserved.
//

#import "ViewController.h"
#import "iCarouselView.h"

@interface ViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) iCarouselView *carousel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _items = [[NSMutableArray alloc]init];
    for (int i = 0; i < 5; i++)
    {
        [_items addObject:@(i)];
    }
    
    [self.view addSubview:self.carousel];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (iCarouselView *)carousel{

    if (!_carousel) {
        _carousel = [[iCarouselView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 300)];
        _carousel.delegate = self;
        _carousel.dataSource = self;
        _carousel.type = iCarouselTypeRotary;
        _carousel.pagingEnabled = YES;
        _carousel.decelerationRate = 10;
        _carousel.isAutoScroll = YES;
        [_carousel scrollToItemAtIndex:1 animated:YES];

    }
    return _carousel;
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [_items count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320/2, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor orangeColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [label.font fontWithSize:50];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    label.text = [_items[index] stringValue];
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    return value * 1.1;

}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{

    NSLog(@"点击的index:%ld",index);
}


@end
