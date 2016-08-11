//
//  MapViewController.m
//  banche
//
//  Created by apple on 16/8/9.
//  Copyright © 2016年 王晓东. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()

@property(nonatomic,strong)CLGeocoder *geo;

@end

@implementation MapViewController

-(CLGeocoder *)geo{
 
    if (!_geo) {
        
        _geo =[[CLGeocoder alloc]init];
        
    }
   
    return _geo;

}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.geo geocodeAddressString:@"济南章丘双山街道与普集镇交界处" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *startPlacemark = [placemarks firstObject];
        
        [self.geo geocodeAddressString:@"济南长清区陈庄路口" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            CLPlacemark *endPlacemark = [placemarks firstObject];
            
            [self startNavWithStartPlacemark:startPlacemark withEndPlacemark:endPlacemark];
        }];
        
        
    }];



    



}

//开始导航的方法
- (void)startNavWithStartPlacemark:(CLPlacemark *)startPlacemark withEndPlacemark:(CLPlacemark *)endPlacemark{
    
    CLPlacemark *clPlacemarkS = startPlacemark;
    
    MKPlacemark *mkPlacemarkS = [[MKPlacemark alloc] initWithPlacemark:clPlacemarkS];
    MKMapItem *item1 = [[MKMapItem alloc] initWithPlacemark:mkPlacemarkS];
    
    CLPlacemark *clPlacemarkE = endPlacemark;
    
    MKPlacemark *mkPlacemarkE = [[MKPlacemark alloc] initWithPlacemark:clPlacemarkE];
    MKMapItem *item2 = [[MKMapItem alloc] initWithPlacemark:mkPlacemarkE];
    
    NSArray *items = @[item1,item2];
    NSDictionary *options = @{
                              //地图类型
                              MKLaunchOptionsMapTypeKey:@(MKMapTypeStandard),
                              
                              //导航方式
                              MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,
                              //是否显示交通
                              MKLaunchOptionsShowsTrafficKey:@(YES)
                              };
    
    //开始导航
    [MKMapItem openMapsWithItems:items launchOptions:options];
    
}


@end
