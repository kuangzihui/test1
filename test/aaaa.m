//
//  aaaa.m
//  test
//
//  Created by 旷自辉 on 15-3-16.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import "aaaa.h"

@implementation aaaa
@synthesize bock;
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (IBAction)ok:(id)sender {
    NSString *str = @"er";
    bock(str);
}

@end