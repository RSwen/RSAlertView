//
//  ViewController.m
//  RSAlertView
//
//  Created by user on 16/5/31.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "RSAlertView.h"

@interface ViewController ()<RSAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   RSAlertView * view= [RSAlertView alertViewInstance];
    view.delegate=self;
    [view show];
}
-(void)RSAlertViewwithSlectedBtnIndex:(NSInteger)BtnIndex{
    
}
@end
