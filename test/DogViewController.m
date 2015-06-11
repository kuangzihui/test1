//
//  DogViewController.m
//  test
//
//  Created by 旷自辉 on 15-4-14.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import "DogViewController.h"

@interface DogViewController ()

@end

@implementation DogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self run:600];
    
    
    // Do any additional setup after loading the view.
    
    
    //[self Eat];
}

- (void) Eat{

    NSLog(@"123");
    
}
- (void)run:(int) gg{
    
    NSLog(@"%d",gg);
}



@end
