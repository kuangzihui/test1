//
//  ATMViewController.h
//  test
//
//  Created by 旷自辉 on 15-3-26.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import "SupperViewController.h"

@interface ATMViewController : SupperViewController
{
    CGFloat sumMoney;
}
@property (nonatomic,assign) CGFloat sumMoney;
- (BOOL) getMoney:(CGFloat) money;
- (BOOL) cunMoney:(CGFloat) money;
- (CGFloat) queryMoney;
@end
