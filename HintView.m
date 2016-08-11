//
//  HintView.m
//  班车
//
//  Created by 管宜号 on 16/7/25.
//  Copyright © 2016年 管宜号. All rights reserved.
//



#import "HintView.h"
#import "Masonry.h"
#import "MainViewController.h"

@implementation HintView

-(instancetype)init{
    
    if (self =[super init]) {
        
        [self creatSubviews];
    }
    return self;
}

-(void)creatSubviews{
    
    self.backgroundColor=[UIColor whiteColor];
    self.layer.cornerRadius=10;
    self.clipsToBounds=YES;
    
    //提示框里各个控件的布局
    UILabel *titleLabel=[[UILabel alloc]init];
    [self addSubview:titleLabel];
    titleLabel.text=@"用户注册";
    titleLabel.textColor=[UIColor blackColor];
    titleLabel.font=[UIFont boldSystemFontOfSize:17];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_top).offset(3);
        make.height.mas_equalTo(30);
    }];
    
    UIView *line=[[UIView alloc]init];
    [self addSubview:line];
    line.backgroundColor=[UIColor lightGrayColor];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(3);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.8);
        make.height.mas_equalTo(0.5);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    UIButton *registerBtn=[[UIButton alloc]init];
    [self addSubview:registerBtn];
    registerBtn.tag=1000;
    [registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    registerBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    [registerBtn setTitle:@"用户注册" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_bottom).offset(3);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.9);
        make.height.mas_equalTo(30);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    UIButton *weixinBtn=[[UIButton alloc]init];
    [self addSubview:weixinBtn];
    [weixinBtn setTitle:@"微信登录" forState:UIControlStateNormal];
    weixinBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    weixinBtn.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    
    [weixinBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(registerBtn.mas_bottom).offset(3);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.9);
        make.height.mas_equalTo(30);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    UIView *line2=[[UIView alloc]init];
    [self addSubview:line2];
    line2.backgroundColor=[UIColor lightGrayColor];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weixinBtn.mas_bottom).offset(3);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.8);
        make.height.mas_equalTo(0.5);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    UIButton *cancelBtn=[[UIButton alloc]init];
    [self addSubview:cancelBtn];
    cancelBtn.tag=1001;
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.titleLabel.font=[UIFont boldSystemFontOfSize:17];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(line2.mas_bottom).offset(3);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.8);
    }];
}

//-(void)notSupport:(UIButton *)notSupport{
//
//    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"提示" message:@"微信登录正在开启中,敬请期待." preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *action =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        
//        NSLog(@"你选择了确定");
//        
//    }];
//
//    [alert addAction:action];
//    
//
//
//}

-(void)cancel:(UIButton *)cancel{
    
    //点击的时候触发block，跳转到mainViewController里面执行。
    self.block(cancel);
}

-(void)registerAction:(UIButton *)registerBtn{
    
    self.block(registerBtn);
}

@end
