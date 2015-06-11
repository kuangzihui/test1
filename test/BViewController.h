//
//  BViewController.h
//  test
//
//  Created by 旷自辉 on 15-3-16.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SupperViewController.h"

@interface BViewController : SupperViewController<UITextFieldDelegate>

@property (nonatomic, strong) id delegate;

//@property (nonatomic, unsafe_unretained) id delegate;

@end
