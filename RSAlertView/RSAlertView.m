

//
//  RSAlertView.m
//  RSAletView
//
//  Created by user on 16/5/31.
//  Copyright © 2016年 user. All rights reserved.
//
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#import "RSAlertView.h"

@interface RSAlertView ()
/**
 蒙板
 */
@property(nonatomic,strong)UIView * maskView;
/**
 主视图
 */
@property(nonatomic,strong)UIView * mainView;

@end
@implementation RSAlertView

+(instancetype)alertViewInstance{
    RSAlertView * alert=[[RSAlertView alloc]init];
    alert.frame = KEY_WINDOW.frame;
    [KEY_WINDOW addSubview:alert];
    [alert addSubviews];
    return alert;
}
-(void)addSubviews{
    [self addSubview:self.maskView];
    [self addSubview:self.mainView];
}

-(UIView *)maskView{
    //蒙版
    if (!_maskView) {
        _maskView=[[UIView alloc]initWithFrame:self.bounds];
        _maskView.backgroundColor=[UIColor blackColor];
        _maskView.alpha=0.2;
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(deleteAlert)];
        [_maskView addGestureRecognizer:tap];
    }
    return _maskView;
}
-(UIView *)mainView{
    if (!_mainView) {
        _mainView=[[UIView alloc]initWithFrame:CGRectMake(20, -200, kScreenWidth-40, 250)];
        _mainView.backgroundColor=[UIColor whiteColor];
        //标题
        UILabel * titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-40, 40)];
        titleLabel.backgroundColor=[UIColor yellowColor];
        titleLabel.text=@"使用该功能需要完善一下资料";
        titleLabel.textAlignment=NSTextAlignmentCenter;
        [_mainView addSubview:titleLabel];
        //内容
        NSArray * contentArr=@[@"常见城市",@"目前身份",@"出生年月"];
        for (int i=0; i<3; i++) {
            UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(0, 40+i*50, kScreenWidth-40, 50)];
            label.text=contentArr[i];
            label.textAlignment=NSTextAlignmentCenter;
            UIView * lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 49, kScreenWidth-40, 1)];
            lineView.backgroundColor=[UIColor lightGrayColor];
            [label addSubview:lineView];
            [_mainView addSubview:label];
        }
        //确定按钮
        UIButton * sureBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.backgroundColor=[UIColor yellowColor];
        [sureBtn setTitle:@"现在去完善" forState:UIControlStateNormal];
        [sureBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        sureBtn.frame=CGRectMake(0, 190, kScreenWidth-40, 60);
        [sureBtn addTarget:self action:@selector(RSAlertViewwithSlected) forControlEvents:UIControlEventTouchUpInside];
        [_mainView addSubview:sureBtn];
    }
    return _mainView;
}

-(void)deleteAlert{
    [UIView animateWithDuration:0.5 animations:^{
        _mainView.frame=CGRectMake(0,kScreenHeight, kScreenWidth,250);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)show{
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        _mainView.center=CGPointMake(self.center.x, self.center.y-50);
    } completion:^(BOOL finished) {
    }];
}

-(void)hide{
    [UIView animateWithDuration:0.5 animations:^{
        _mainView.frame=CGRectMake(0,kScreenHeight, kScreenWidth,250);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
   }];
}

-(void)RSAlertViewwithSlected{
    if ([_delegate respondsToSelector:@selector(RSAlertViewwithSlectedBtnIndex:)]) {
        [_delegate RSAlertViewwithSlectedBtnIndex:1];
    }
}

@end
