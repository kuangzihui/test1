//
//  aaaa.h
//  test
//
//  Created by 旷自辉 on 15-3-16.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^yearBlock) (NSString *);


@interface aaaa : UIView

@property (nonatomic, strong) yearBlock bock;
- (IBAction)ok:(id)sender;

@end
