//
//  RegisterViewController.m
//  banche
//
//  Created by 管宜号 on 16/7/25.
//  Copyright © 2016年 管宜号. All rights reserved.
//

#import "RegisterViewController.h"
//#import <MaxLeap/MaxLeap.h>


#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height



@interface RegisterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSMutableArray *datalist;

@property(nonatomic,strong)UITextField *phoneField;//手机号码
@property(nonatomic,strong)UITextField *verificationFleld;//验证码
@property(nonatomic,strong)UIButton *determine;//确定按钮
//@ property(nonatomic,strong)UIButton *codeButton;//验证码按钮
@property (nonatomic,strong)UITableView *tableView;//路线视图
//@property(nonatomic,strong)MLUser *user;

@end

@implementation RegisterViewController
///
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor grayColor];
    
    UILabel *name =[[UILabel alloc]initWithFrame:CGRectMake(30, 100, 200, 30)];
    name.text =@"请输入手机号:";
    UILabel *phone =[[UILabel alloc]initWithFrame:CGRectMake(30, 200, 200, 30)];
    phone.text =@"请输入验证码:";
    
    
    _phoneField =[[UITextField alloc]initWithFrame:CGRectMake(30, 140, 200, 30)];
    _phoneField.textColor =[UIColor blackColor];
    _phoneField.placeholder = @"请输入手机号";
    _phoneField.borderStyle =UITextBorderStyleLine;
    
    
    
    _verificationFleld =[[UITextField alloc]initWithFrame:CGRectMake(30, 240, 200, 30)];
    _verificationFleld.textColor =[UIColor blackColor];
    _verificationFleld.placeholder =@"请输入验证码";
    _verificationFleld.borderStyle =UITextBorderStyleLine;
    
    
//    _codeButton =[[UIButton alloc]initWithFrame:CGRectMake(30, 240, 500, 30)];
//    [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//    
//    [_codeButton addTarget:self action:@selector(code:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *luxian =[[UILabel alloc]initWithFrame:CGRectMake(30, 280, 200, 30)];
    luxian.text =@"请选择要乘坐的路线";
//    UILabel *jingshiu =[[UILabel alloc]initWithFrame:CGRectMake(30, 330, 200,30 )];
//    jingshiu.text =@"经十路";
//    UILabel *lvyoulu =[[UILabel alloc]initWithFrame:CGRectMake(30, 380, 200, 30)];
//    lvyoulu.text =@"旅游路";
//    
    _datalist = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"news" ofType:@"plist"]];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 293, kScreenW, 200) style:UITableViewStylePlain];
    
    _tableView.backgroundColor =[UIColor grayColor];
    _tableView.dataSource = self;
    
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];

    
    
    
    
    
    
     _determine =[[UIButton alloc]initWithFrame:CGRectMake(30, 485, 340, 40)];
    [_determine setTitle:@"确定" forState:UIControlStateNormal];
    
//    [determine addTarget:self action:@selector(determine:) forControlEvents:UIControlEventTouchUpInside];

//    [_determine addTarget:self action:@selector(pickView:) forControlEvents:UIControlStateNormal];
    
    
    [_determine setBackgroundImage:[UIImage imageNamed:@"determine"] forState:UIControlStateNormal];
    
    [_determine setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    [self.view addSubview:name];
    [self.view addSubview:phone];
    [self.view addSubview:_verificationFleld];
    [self.view addSubview:_phoneField];
    [self.view addSubview:luxian];
    [self.view addSubview:_determine];
//  [self.view addSubview:_codeButton];

}



-(void)code:(UIButton *)button{

//    [MLUser requestLoginSmsCodeWithPhoneNumber:_phoneField.text block:^(BOOL succeeded, NSError * _Nullable error) {
//        
//        if (succeeded && !error) {
//            
//            NSLog(@"验证码发送成功!");
//            
//            [_codeButton setUserInteractionEnabled:NO];
//            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//                [_codeButton setUserInteractionEnabled:YES];
//                
//            });
//            
//        }
//        
//    }];
//    
//    NSLog(@"验证码");
//
//



}




#pragma mark --UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return    2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identy = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identy];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(190, 5, kScreenW, 30)];
        title.tag = 102;
        title.font = [UIFont boldSystemFontOfSize:20];
        [cell addSubview:title];

        
        
        
    }
    
    NSDictionary *dic = [_datalist objectAtIndex:indexPath.row];

    UILabel *title = [cell viewWithTag:102];
    title.text = dic[@"title"];
    

    
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
