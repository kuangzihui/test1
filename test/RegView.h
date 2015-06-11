//
//  RegView.h
//  test
//
//  Created by 旷自辉 on 14-8-26.
//  Copyright (c) 2014年 旷自辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegView : UIView <UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTab;
    NSMutableArray *regArr;
}
@end
