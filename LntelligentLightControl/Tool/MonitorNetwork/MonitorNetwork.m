//
//  MonitorNetwork.m
//  LntelligentLightControl
//
//  Created by BearClawr on 16/10/10.
//  Copyright © 2016年 后步. All rights reserved.
//

#import "MonitorNetwork.h"

@implementation MonitorNetwork

//创建网络监听管理类对象
static AFNetworkReachabilityManager *manager = nil;

/**
 * 初始化AFNetworkReachabilityManager对象  进行网络状态监听
 */
+ (void)startUpMonitorNetwork{
    manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态发生改变的时候调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WIFI");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"自带网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            default:
                break;
        }
    }];
    // 开始监控
    [manager startMonitoring];
}


/**
 * 关闭网络状态监听
 */
+ (void)stopMonitoring{
    [manager stopMonitoring];
}
@end
