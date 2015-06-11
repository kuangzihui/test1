//
//  BViewController.m
//  test
//
//  Created by 旷自辉 on 15-3-16.
//  Copyright (c) 2015年 旷自辉. All rights reserved.
//

#import "BViewController.h"
#import "ViewController.h"
#import "ATMViewController.h"
#import "BtnViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

typedef void (^okBlock) (NSString *ss);

@interface BViewController ()

@end

@implementation BViewController
{
    UITextField *inputField;
    UIView *backView;
    UIView *addView;
    BOOL isTan;
    BOOL isAdd;
}
@synthesize delegate;


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden =  YES;
}

- (void)viewDidLoad {
   
    showLeftNavBarItem = NO;
    showRightNavBarItem = YES;
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.naviItem.title = @"ATM";
    [rightNavBtn setTitle:@"提交" forState:UIControlStateNormal];
    
    backView = [[UIView alloc] initWithFrame:CGRectMake(0,SCREEN_HEIGHT-45,SCREEN_WIDTH, 45)];
    backView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:backView];
    
    inputField = [[UITextField alloc] initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH-70, 35)];
    inputField.delegate = self;
    inputField.backgroundColor = [UIColor whiteColor];
    
    [backView addSubview:inputField];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame = CGRectMake(SCREEN_WIDTH-50, 5, 40, 35);
    [addBtn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:addBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    isAdd = NO;
    return [textField resignFirstResponder];
}


- (void)keyboardWillShow:(NSNotification *)notification {
    
    
    CGRect newRect = addView.frame;
    newRect.origin.y = SCREEN_HEIGHT;
    addView.frame = newRect;

    
    NSDictionary *userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    // 根据老的 frame 设定新的 frame
    CGRect newTextViewFrame = backView.frame; // by michael
    newTextViewFrame.origin.y = keyboardRect.origin.y - backView.frame.size.height;
    
    // 键盘的动画时间，设定与其完全保持一致
//    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//    NSTimeInterval animationDuration;
//    [animationDurationValue getValue:&animationDuration];
//    
//    // 键盘的动画是变速的，设定与其完全保持一致
//    NSValue *animationCurveObject = [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
//    NSUInteger animationCurve;
//    [animationCurveObject getValue:&animationCurve];
//    
//    // 开始及执行动画
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:animationDuration];
//    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
//    backView.frame = newTextViewFrame;
//    [UIView commitAnimations];
    
    
    [UIView setAnimationDuration:[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
    [UIView setAnimationCurve:(UIViewAnimationCurve)[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey]];
    backView.frame = newTextViewFrame;
   
    [UIView commitAnimations];
    
    isTan = YES;
}
//键盘消失时的处理，文本输入框回到页面底部。
- (void)keyboardWillHide:(NSNotification *)notification {
    isTan = NO;
    if (isAdd) {
        isAdd = NO;
        return ;
    }
    NSDictionary* userInfo = [notification userInfo];
    
    // 键盘的动画时间，设定与其完全保持一致
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    // 键盘的动画是变速的，设定与其完全保持一致
    NSValue *animationCurveObject =[userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    NSUInteger animationCurve;
    [animationCurveObject getValue:&animationCurve];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
    CGRect newTextViewFrame = backView.frame;
    newTextViewFrame.origin.y = SCREEN_HEIGHT - backView.frame.size.height;
    backView.frame = newTextViewFrame;
    [UIView commitAnimations];
}

- (void) rightNavBarItemPressed
{
    BtnViewController *btnVC = [[BtnViewController alloc] initWithShowCustomNavigationBar:YES];
    [self.navigationController pushViewController:btnVC animated:YES];
}

- (void) addBtnAction
{
    if (addView!= nil && addView.frame.origin.y<SCREEN_HEIGHT) {
        
        CGRect newRect = addView.frame;
        newRect.origin.y = SCREEN_HEIGHT;
        addView.frame = newRect;
        [inputField becomeFirstResponder];
        isAdd = YES;
        return ;
    }
    
    if (addView == nil) {
        addView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 250)];
        addView.backgroundColor = [UIColor redColor];
        [self.view addSubview:addView];
    }
    
    if (isTan) {
        
        [inputField resignFirstResponder];
        
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect newRect = addView.frame;
        newRect.origin.y-=250;
        addView.frame = newRect;
        
        CGRect newBackRect = backView.frame;
        newBackRect.origin.y = SCREEN_HEIGHT-250-backView.frame.size.height;
        backView.frame = newBackRect;
    }];
    
}

@end
