//
//  AppDelegate.m
//  班车
//
//  Created by 管宜号 on 16/7/24.
//  Copyright © 2016年 管宜号. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <MaxLeap/MaxLeap.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [MaxLeap setApplicationId:@"579eb36ca5ff7f0001da3bcc" clientKey:@"a3M0LTN1UzN5SXUxTzJNLUw3ckUxQQ" site:MLSiteCN];
    
    MLObject *obj = [MLObject objectWithoutDataWithClassName:@"Test" objectId:@"561c83c0226"];
    [obj fetchIfNeededInBackgroundWithBlock:^(MLObject * _Nullable object, NSError * _Nullable error) {
        if (error.code == kMLErrorInvalidObjectId) {
            NSLog(@"已经能够正确连接上您的云端应用");
        } else {
            NSLog(@"应用访问凭证不正确，请检查%@",error);
        }
    }];
    
    MainViewController *mainVC=[[MainViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:mainVC];
    
    self.window.rootViewController=nav;
    
    [NSThread sleepForTimeInterval:2];//设置启动页面时间
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
