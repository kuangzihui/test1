//
//  ATMViewController.m
//  test
//
//  Created by 旷自辉 on 15-3-26.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import "ATMViewController.h"

@interface ATMViewController ()

@end

@implementation ATMViewController
@synthesize sumMoney;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) getMoney:(CGFloat) money
{
    if (sumMoney>money && money>0) {
        sumMoney -= money;
        return YES;
    }
    return NO;
}

- (BOOL) cunMoney:(CGFloat) money
{
    if (money>0) {
        sumMoney += money;
        return YES;
    }
    return NO;
}

- (CGFloat) queryMoney
{
    return sumMoney;
}
@end
