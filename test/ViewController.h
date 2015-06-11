//
//  ViewController.h
//  test
//
//  Created by 旷自辉 on 14-8-26.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SupperViewController.h"

@protocol ClassBDelegate

- (void)methodTwo:(NSString *)value;

@end

typedef void (^okBlock)(NSString *str);

@interface ViewController : SupperViewController
{
    okBlock ok;
}
@property (strong,nonatomic) okBlock ok;

@end
