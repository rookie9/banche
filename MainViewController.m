
//
//  MainViewController.m
//  班车
//
//  Created by 管宜号 on 16/7/24.
//  Copyright © 2016年 管宜号. All rights reserved.
//

#import "MainViewController.h"

#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width
#import "HintView.h"
#import "Masonry.h"
#import "RegisterViewController.h"
#import "MoreViewController.h"
#import "ViewController.h"
#import "MapViewController.h"
#import "LMapViewController.h"

@interface MainViewController ()
@property (nonatomic,strong)HintView *hintView;
@property (nonatomic,strong)UIView *bottomView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.title=@"我的班车";
    self.view.backgroundColor=[UIColor whiteColor];
    
    //创建导航栏
    [self creatNavBar];
    
    //创建按钮组
    [self creatSubviews];
}

-(void)creatNavBar{
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    //左侧退出按钮
    UIButton *exitBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    exitBtn.tag =100;
    [exitBtn setTitle:@"退出" forState:UIControlStateNormal];
    [exitBtn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:exitBtn];
    
    //右侧管理按钮
    UIButton *manageBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [manageBtn setTitle:@"管理" forState:UIControlStateNormal];
    [manageBtn addTarget:self action:@selector(manage:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:manageBtn];
    
}

-(void)creatSubviews{
   
    NSArray *colorArray=[NSArray arrayWithObjects:[UIColor orangeColor],[UIColor cyanColor],[UIColor magentaColor],[UIColor greenColor],[UIColor brownColor],[UIColor purpleColor], nil];
    
    NSArray *titleArray=[NSArray arrayWithObjects:@"班车长", @"坐班车", @"登录", @"换班车", @"更多", @"线路", nil];
    for (NSInteger i=0; i<6; i++) {
        
        UIButton *btn=[[UIButton alloc]init];
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=100+i;
        btn.backgroundColor=colorArray[i];
        [self.view addSubview:btn];
        if (i<2) {
            btn.frame=CGRectMake(kScreenW/2 * i,64, kScreenW/2, (kScreenH-64)/3);
        }else if (2<=i&&i<4){
            btn.frame=CGRectMake(kScreenW/2 * (i-2),(kScreenH-64)/3+64, kScreenW/2, (kScreenH-64)/3);
        }else{
            btn.frame=CGRectMake(kScreenW/2 * (i-4),(kScreenH-64)/3*2+64, kScreenW/2, (kScreenH-64)/3);
        }
        btn.transform=CGAffineTransformMakeScale(0.99, 0.99);
        
    }
    
    self.bottomView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 230)];
    self.bottomView.backgroundColor =[UIColor greenColor];
    [self.view addSubview:self.bottomView];
    
    UIButton *button1 =[[UIButton alloc]initWithFrame:CGRectMake(10, 74, 120,120 )];
    UIButton *button2 =[[UIButton alloc]initWithFrame:CGRectMake(150, 74, 120, 120)];
    UIButton *button3 =[[UIButton alloc]initWithFrame:CGRectMake(290, 74, 120, 120)];

    UIImage *image1 =[UIImage imageNamed:@"map.jpg"];
    [button1 setImage:image1 forState:UIControlStateNormal];
    
    UIImage *image2 =[UIImage imageNamed:@"1.gif"];
    [button2 setImage:image2 forState:UIControlStateNormal];
    
    UIImage *image3 =[UIImage imageNamed:@"more.jpeg"];
    [button3 setImage:image3 forState:UIControlStateNormal];
    
    UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(10, 199, 120, 20)];
    UILabel *label2 =[[UILabel alloc]initWithFrame:CGRectMake(150, 199, 120, 20)];
    UILabel *label3 =[[UILabel alloc]initWithFrame:CGRectMake(290, 199, 120, 20)];
    label1.text =@"下载济南市地图";
    label2.text =@"微信登录";
    label3.text =@"关于我们";
    label1.textAlignment = NSTextAlignmentCenter;
    label2.textAlignment = NSTextAlignmentCenter;
    label3.textAlignment = NSTextAlignmentCenter;
    
    [button1 addTarget:self action:@selector(myButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.bottomView addSubview:button1];
    [self.bottomView addSubview:button2];
    [self.bottomView addSubview:button3];
    [self.bottomView addSubview:label1];
    [self.bottomView addSubview:label2];
    [self.bottomView addSubview:label3];
    self.bottomView.hidden=YES;
    
}


#pragma mark - 按钮点击方法

-(void)btnAction:(UIButton *)button{
    
        switch (button.tag) {
            case 100:
            {
                NSLog(@"班车长");
                
                if (!self.hintView) {
                    
                    self.hintView=[[HintView alloc]init];
                    [self.view addSubview:self.hintView];
                    self.hintView.alpha=0;
                    [self.hintView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.mas_equalTo(self.view.mas_centerX);
                        make.centerY.mas_equalTo(self.view.mas_centerY);
                        make.height.mas_equalTo(150);
                        make.width.mas_equalTo(300);
                    }];
                }
                
                //防止循环引用
                __weak MainViewController *weakSelf=self;
                
                [self.hintView setBlock:^(UIButton *button) {
                    
                    //在hintView里面执行的block在此处执行
                    __strong MainViewController *strongSelf=weakSelf;
                    
                    //判断回调回来的button按钮是哪一个
                    if (button.tag==1000) {
                        
                        //跳转控制器
                        
                        RegisterViewController *registerVC=[[RegisterViewController alloc]init];
                     
                        [strongSelf.navigationController pushViewController:registerVC animated:YES];
                        
                        //提示窗口渐变消失
                        [UIView animateWithDuration:0.5 animations:^{
                            
                            strongSelf.hintView.alpha=0;
                            
                        }];
                        
                    }else{
                        
                        //提示窗口渐变消失
                        [UIView animateWithDuration:0.5 animations:^{
                            
                            strongSelf.hintView.alpha=0;
                            
                        }];
                        
                    }
                }];
                
                //提示窗口渐变出现
                [UIView animateWithDuration:0.5 animations:^{
                    
                    self.hintView.alpha=1;
                    
                }];
                
            }
                break;
            case 101:
            {
                NSLog(@"坐班车");
                
                if (!self.hintView) {
                    
                    self.hintView=[[HintView alloc]init];
                    [self.view addSubview:self.hintView];
                    self.hintView.alpha=0;
                    [self.hintView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerX.mas_equalTo(self.view.mas_centerX);
                        make.centerY.mas_equalTo(self.view.mas_centerY);
                        make.height.mas_equalTo(150);
                        make.width.mas_equalTo(300);
                    }];
                }
                
                //防止循环引用
                __weak MainViewController *weakSelf=self;
                
                [self.hintView setBlock:^(UIButton *button) {
                    
                    //在hintView里面执行的block在此处执行
                    __strong MainViewController *strongSelf=weakSelf;
                    
                    //判断回调回来的button按钮是哪一个
                    if (button.tag==1000) {
                        
                        //跳转控制器
                        
                        RegisterViewController *registerVC=[[RegisterViewController alloc]init];
                        
                        [strongSelf.navigationController pushViewController:registerVC animated:YES];
                        
                        //提示窗口渐变消失
                        [UIView animateWithDuration:0.5 animations:^{
                            
                            strongSelf.hintView.alpha=0;
                            
                        }];
                        
                    }else{
                        
                        //提示窗口渐变消失
                        [UIView animateWithDuration:0.5 animations:^{
                            
                            strongSelf.hintView.alpha=0;
                            
                        }];
                        
                    }
                }];
                
                //提示窗口渐变出现
                [UIView animateWithDuration:0.5 animations:^{
                    
                    self.hintView.alpha=1;
                    
                }];

                
    }
                break;
            case 102:
            {
                NSLog(@"登录");
                
                RegisterViewController *regist =[[RegisterViewController alloc]init];
                
                [self.navigationController pushViewController:regist animated:YES];
                

                
        }
                break;
            case 103:
            {
                NSLog(@"换班车");
                UIAlertController *huanche =[UIAlertController alertControllerWithTitle:@"选择班车" message:nil preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *shilu = [UIAlertAction actionWithTitle:@"经十路" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    NSLog(@"选择经十路");
                    
                    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"提示" message:@"您还没有注册,请您先行注册" preferredStyle:UIAlertControllerStyleAlert];
                        
                        UIAlertAction *action1 =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                            NSLog(@"你选择了确定");
                            
                        }];
                        
                        [alert addAction:action1];
                        
                    [self presentViewController:alert animated:YES completion:^{
                       
                        
                    }];
                    
                  
        }];
                
                UIAlertAction *lvyou = [UIAlertAction actionWithTitle:@"旅游路" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    NSLog(@"选择旅游路");
                    
                    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"提示" message:@"您还没有注册,请您先行注册" preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *action1 =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                        NSLog(@"你选择了确定");
                        
                    }];
                    
                    [alert addAction:action1];
                    
                    
                    [self presentViewController:alert animated:YES completion:^{
                        
                        
                    }];
                    
                    
                }];

                UIAlertAction *quxiao = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    
                    NSLog(@"cancel");
                    
                }];
                
                [huanche addAction:shilu];
                [huanche addAction:lvyou];
                [huanche addAction:quxiao];
                
                [self presentViewController:huanche animated:YES completion:^{
                    
                }];
                
               
            }
                break;
            case 104:
            {
                NSLog(@"更多");
                
                MoreViewController *moreVC =[[MoreViewController alloc]init];
                
                [self.navigationController pushViewController:moreVC animated:YES];
                
                
            }
                break;
            case 105:
            {
                NSLog(@"线路");
                
//                ViewController  *viewC =[[ViewController alloc]init];
                
               
                UIAlertController *xuanzeluxian =[UIAlertController alertControllerWithTitle:@"选择路线" message:nil preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                    //点击action 执行的code...
                    
                    NSLog(@"cancel");
                    
                    
                }];
                
                
                
                UIAlertAction *action1 =[UIAlertAction actionWithTitle:@"经十路" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   
                    MapViewController *mapView =[[MapViewController alloc]init];
                    
                    [self.navigationController pushViewController:mapView animated:YES];
                    
                    
                }];
             
                UIAlertAction *action2 =[UIAlertAction actionWithTitle:@"旅游路" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   
                    LMapViewController *lMapView =[[LMapViewController alloc]init];
                    [self.navigationController pushViewController:lMapView animated:YES];
                    
                    
                }];
                
                [xuanzeluxian addAction:action3];
                [xuanzeluxian addAction:action1];
                [xuanzeluxian addAction:action2];
                
                
                
                [self presentViewController:xuanzeluxian animated:YES completion:^{
                    
                }];
                
                
            }
                break;
                

        }
}
-(void)exit:(UIButton *)exit{
 
        //退出程序
        [[UIApplication sharedApplication] performSelector:@selector(terminateWithSuccess)];
    
        NSLog(@"点击退出");
   
    
}

-(void)terminateWithSuccess{


}

//点击管理按钮
-(void)manage:(UIButton *)manage{
    
    manage.selected=!manage.selected;
    self.bottomView.hidden=!manage.selected;
    
    //点击管理
    NSLog(@"点击管理");
}

-(void)myButton:(UIButton *)sender{
    
    UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"提示" message:@"您使用的济南地图已经是最新版不用重新下载." preferredStyle:UIAlertControllerStyleAlert];
    
    //创建 action
    UIAlertAction *action =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"你选择了确定");
        
    }];
    
    [alert addAction:action];
    
    //推出
    [self presentViewController:alert animated:YES completion:^{
        
    }];
    
    
    
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
