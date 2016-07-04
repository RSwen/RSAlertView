//
//  RSAlertView.h
//  RSAletView
//
//  Created by user on 16/5/31.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RSAlertViewDelegate <NSObject>

-(void)RSAlertViewwithSlectedBtnIndex:(NSInteger)BtnIndex;

@end
@interface RSAlertView : UIView

@property(nonatomic,weak)id <RSAlertViewDelegate> delegate;

+(instancetype)alertViewInstance;

-(void)show;

-(void)hide;

@end
