//
//  AppDelegate.m
//  LntelligentLightControl
//
//  Created by BearClawr on 16/10/10.
//  Copyright © 2016年 后步. All rights reserved.
//

#import "AppDelegate.h"

#import "GuidePageController.h"         //初始导航界面
#import "SearchEquipmentController.h"   //设备搜索界面（主界面）
#import "MonitorNetwork.h"              //监听网络状态

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController *controller = [[UIViewController alloc] init];            //window 根视图控制器对象
    //是否初次启动程序
    if ([kUserDefault boolForKey:kStartUpFirst]) {
        //进入引导界面
        [kUserDefault setBool:YES forKey:kStartUpFirst];
        controller = [[GuidePageController alloc] init]; 
    }else{
        //进入设备搜索界面
        controller = [[SearchEquipmentController alloc] init];
    }
    self.window.rootViewController = controller;  //添加window的根视图控制器
    
    //监听网络状态
    [MonitorNetwork startUpMonitorNetwork];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
