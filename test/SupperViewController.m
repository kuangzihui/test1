//
//  SupperViewController.m
//  test
//
//  Created by 旷自辉 on 15-3-26.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import "SupperViewController.h"

@interface SupperViewController ()

@end

@implementation SupperViewController

@synthesize backItem,rightItem,naviBar,naviItem,backNavBtn,rightNavBtn;

- (id) init
{
    if (self = [super init]) {
        [self invaied];
    }
    return self;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self invaied];
    }
    return self;
}

- (id) initWithShowCustomNavigationBar:(BOOL)isShow
{
    self = [super init];
    if (self) {
        showCustomNavigationBar = isShow;
        showRightNavBarItem = NO;
        showLeftNavBarItem = YES;
        appDete = (AppDelegate *) [UIApplication sharedApplication].delegate;
    }
    return self;
}

- (void) invaied
{
    appDete = (AppDelegate *) [UIApplication sharedApplication].delegate;
    showCustomNavigationBar = YES;
    showRightNavBarItem = NO;
    showLeftNavBarItem = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    if (showCustomNavigationBar) {
        naviBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 44)];
        if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
            naviBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        }
        naviBar.tintColor = [UIColor redColor];
        [[UINavigationBar appearance]setBarTintColor:[UIColor redColor]];
        [self.view addSubview:naviBar];
        self.naviBar.translucent = NO;
        naviItem = [[UINavigationItem alloc] initWithTitle:@""];
        [naviBar pushNavigationItem:naviItem animated:NO];
        
        if (showLeftNavBarItem) {
            self.backNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            self.backNavBtn.frame = CGRectMake(0, 0, 15, 15);
            
            [backNavBtn setImage:[UIImage imageNamed:@"icon_jiantou.png"] forState:UIControlStateNormal];
            [backNavBtn addTarget:self action:@selector(letNavBarItemPressed) forControlEvents:UIControlEventTouchUpInside];
            backNavBtn.showsTouchWhenHighlighted = YES;
            backItem = [[UIBarButtonItem alloc] initWithCustomView:backNavBtn];
            naviItem.leftBarButtonItem = self.backItem;
        }
        
        if (showRightNavBarItem) {
            self.rightNavBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            rightNavBtn.frame = CGRectMake(0, 0, 48, 30);
            [rightNavBtn setTitle:@"" forState:UIControlStateNormal];
            rightNavBtn.titleLabel.font = [UIFont systemFontOfSize:13];
            [rightNavBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [rightNavBtn addTarget:self action:@selector(rightNavBarItemPressed) forControlEvents:UIControlEventTouchUpInside];
            
            rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightNavBtn];
            naviItem.rightBarButtonItem = rightItem;
        }

        
    }
//     if ([UIDevice currentDevice].systemVersion.floatValue>=7.0) {
//        self.naviBar.frame = CGRectMake(0, 0, 320, 64);
//        
//        [[UINavigationBar appearance]setBarTintColor:[UIColor redColor]];
//        
//        naviBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
//        self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
//        [naviBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:18.0],UITextAttributeFont,[UIColor whiteColor],UITextAttributeTextColor, nil]];
//        //        self.edgesForExtendedLayout = UIRectEdgeNone;
//        //        self.extendedLayoutIncludesOpaqueBars = NO;
//    }
}


- (void) letNavBarItemPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

-  (void) rightNavBarItemPressed
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
