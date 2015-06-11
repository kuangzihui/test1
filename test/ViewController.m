//
//  ViewController.m
//  test
//
//  Created by 旷自辉 on 14-8-26.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "RegView.h"
#import "BViewController.h"
#import "DogViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize ok;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginAfterRegister:) name:@"change" object:nil];
   // [self daX];
    
    [self methodTwo:@""];
    
    UINavigationController *navB;

    
    DogViewController *bb = [[DogViewController alloc] init];
    
    navB = [[UINavigationController alloc] initWithRootViewController:bb];
     //navB.navigationBar.tintColor = [UIColor greenColor];
    appDete.window.rootViewController = navB;
    
}

- (void) btnClick:(UIButton *) sender
{
    
   
    
}

- (void) loginAfterRegister:(NSNotification *) tf
{
   NSDictionary *dic =  tf.userInfo;
    NSLog(@"shou dao tong zhi l ===%@",[dic objectForKey:@"1"]);
}

- (void)methodTwo:(NSString *)value
{
    NSLog(@"value");
    
    for (int i = 3; i<=100; i++) {
        BOOL f = YES;
        if (i%2!=0) {
            
            for (int j = 2; j<=i-1; j++) {
                if (i%j == 0) {
                    f = NO;
                    break;
                }
                
            }

        }
        else
        {
            f = NO;
        }
        
        if (f) {
            NSLog(@"%d",i);
        }
        
        
    }
}

- (int) getkk

{
    return 5;
}

@end
