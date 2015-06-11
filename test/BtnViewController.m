//
//  BtnViewController.m
//  test
//
//  Created by 旷自辉 on 15-3-27.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import "BtnViewController.h"

@interface BtnViewController ()
{
    UIView *firstView;
    UIView *subView;
    UIButton *bn;
    UIView *caramView;
}
@end

@implementation BtnViewController

- (void)viewDidLoad {
    showCustomNavigationBar = YES;
    showRightNavBarItem = YES;
    [super viewDidLoad];
    [rightNavBtn setTitle:@"拍照" forState:UIControlStateNormal];
    UISegmentedControl *segMent = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    segMent.segmentedControlStyle = UISegmentedControlStyleBar;
    segMent.momentary = NO;
    [segMent insertSegmentWithTitle:@"动态" atIndex:0 animated:YES];
    [segMent insertSegmentWithTitle:@"消息" atIndex:1 animated:YES];
    segMent.tintColor = [UIColor lightGrayColor];
    segMent.selectedSegmentIndex = 0;
    [segMent addTarget:self action:@selector(segMentActon:) forControlEvents:UIControlEventValueChanged];
    
    self.naviItem.titleView = segMent;
    
    firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, [UIScreen mainScreen].bounds.size.height-64)];
    firstView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:firstView];

}

- (void) segMentActon :(UISegmentedControl *) sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self firstSegment];
            break;
        case 1:
            [self twoSegment];
            break;
        default:
            break;
    }
}

- (void) firstSegment
{
    if (firstView == nil) {
        firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, [UIScreen mainScreen].bounds.size.height-64)];
        firstView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:firstView];
    }
    [UIView animateWithDuration:0.5 animations:^{
        CGRect newSubRect = subView.frame;
        newSubRect.origin.x = [UIScreen mainScreen].bounds.size.width;
        subView.frame = newSubRect;
        
        CGRect newFram = firstView.frame;
        newFram.origin.x = 0;
        firstView.frame = newFram;
    }];
}

- (void) twoSegment
{
    if (subView == nil) {
        subView = [[UIView alloc] initWithFrame:CGRectMake(320, 64, 320, [UIScreen mainScreen].bounds.size.height-64)];
        subView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:subView];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect newFirstRect = firstView.frame;
        newFirstRect.origin.x = -320;
        firstView.frame = newFirstRect;
        
        CGRect newFram = subView.frame;
        newFram.origin.x = 0;
        subView.frame = newFram;
    }];
}

- (void) rightNavBarItemPressed
{
    if (bn == nil) {
        bn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        bn.backgroundColor = [UIColor grayColor];
        bn.alpha = 0.5;
        [bn addTarget:self action:@selector(hiddenBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bn];
    }
    bn.hidden = NO;
    
    if (caramView == nil) {
        caramView = [[UIView alloc] initWithFrame:CGRectMake(0, 568, 320, 200)];
        caramView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:caramView];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = caramView.frame;
        rect.origin.y = 568-200;
        caramView.frame = rect;
    }];
}

- (void) hiddenBtn
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = caramView.frame;
        rect.origin.y = 568;
        caramView.frame = rect;
    }];
    bn.hidden = YES;
}

@end
