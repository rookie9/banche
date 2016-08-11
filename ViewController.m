//
//  ViewController.m
//  banche
//
//  Created by 管宜号 on 16/7/25.
//  Copyright © 2016年 管宜号. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <BaiduTraceSDK/BaiduTraceSDK-Swift.h>
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<MKMapViewDelegate>

@property(nonatomic,strong)MKMapView *mapView;//地图视图
@property (nonatomic,strong)CLLocationManager *locationManger;//定位管理



@end

@implementation ViewController

-(CLLocationManager *)locationManger{
    if (!_locationManger) {
        _locationManger = [[CLLocationManager alloc] init];
        [_locationManger requestAlwaysAuthorization];
    }
    
    return _locationManger;
}



- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view.backgroundColor =[UIColor whiteColor];
    [self locationManger];
    _mapView =[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
    self.mapView.delegate = self;
    
    [self.view addSubview:_mapView];
    
    self.mapView.mapType = MKMapTypeStandard;

    
    //显示用户位置
    self.mapView.showsUserLocation = YES;
    //是否追踪用户位置
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
//    [CLLocationManager requestWhenInUseAuthorization] 

}

#pragma mark - MKMapViewDelegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    userLocation.title = @"我在这";
    userLocation.subtitle = @"等待班车";
    
    [self.mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    
    //设置显示区域//0.016506  0.011032
    MKCoordinateSpan span = MKCoordinateSpanMake(0.016506, 0.011032);

    MKCoordinateRegion regin = MKCoordinateRegionMake(userLocation.location.coordinate, span);
    
    [mapView setRegion:regin animated:YES];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
