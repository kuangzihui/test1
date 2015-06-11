//
//  RegView.m
//  test
//
//  Created by 旷自辉 on 14-8-26.
//  Copyright (c) 2014年 旷自辉. All rights reserved.
//

#import "RegView.h"

@implementation RegView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        regArr = [NSMutableArray arrayWithObjects:@"上海",@"上海",@"上海",@"上海",@"上海",@"上海", nil];
        myTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 150, 250) style:UITableViewStylePlain];
        myTab.delegate = self;
        myTab.dataSource  = self;
        [self addSubview:myTab];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return regArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identity = @"regID";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (myCell == nil) {
        myCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    myCell.textLabel.text = regArr[indexPath.row];
    return myCell;
}

@end
