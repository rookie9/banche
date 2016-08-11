//
//  MoreViewController.m
//  banche
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 管宜号. All rights reserved.
//

#import "MoreViewController.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

//  主要是用来取数据包的，里面设置好程序的 Identity  身份 就可以取到了，还可以设置其它的很多信息，不过都要通过 那个 Id 来取得。



@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    
    UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(0, 80,kScreenW , 40)];
    label1.text =@"扫描二维码下载班车应用";
    label1.font =[UIFont systemFontOfSize:30];
    UILabel *label2 =[[UILabel alloc]initWithFrame:CGRectMake(0,470,kScreenW,40)];
    label2.text =@"版本号1.9";
    label2.font =[UIFont systemFontOfSize:30];
    UIImage *image =[UIImage imageNamed:@"more.jpeg"];
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(60, 130, 300, 300)];
    imageView.image =image;
    
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 550, kScreenW, 40)];
    view.backgroundColor =[UIColor blueColor];
    UIButton *shengji =[[UIButton alloc]initWithFrame:CGRectMake(15, 550, kScreenW, 30)];
    [shengji setTitle:@"升级" forState:UIControlStateNormal];
    [shengji setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shengji addTarget:self action:@selector(wodetianna:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:imageView];
    [self.view addSubview:view];
    [self.view addSubview:shengji];
}

-(void)wodetianna:(UIButton *)sender{


    NSLog(@"点击升级");

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
