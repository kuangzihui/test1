//
//  SupperViewController.h
//  test
//
//  Created by 旷自辉 on 15-3-26.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SupperViewController : UIViewController
{
    AppDelegate *appDete;
    BOOL showLeftNavBarItem;
    BOOL showRightNavBarItem;
    BOOL showCustomNavigationBar;
    
    UIButton *rightNavBtn;
    UIButton *backNavBtn;
    UIBarButtonItem *backItem;
    UIBarButtonItem *rightItem;
    
    UINavigationBar *naviBar;
    UINavigationItem *naviItem;
}

@property (nonatomic,strong) UIButton *rightNavBtn;
@property (nonatomic,strong) UIButton *backNavBtn;
@property (nonatomic,strong) UIBarButtonItem *backItem;
@property (nonatomic,strong) UIBarButtonItem *rightItem;
@property (nonatomic,strong) UINavigationBar *naviBar;
@property (nonatomic,strong) UINavigationItem *naviItem;

- (void) letNavBarItemPressed;
- (void) rightNavBarItemPressed;
- (id) initWithShowCustomNavigationBar:(BOOL) isShow;

@end
