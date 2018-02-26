//
//  CWNetworkSettings.h
//  CWApp
//
//  Created by wcw on 2018/2/24.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWNetworkSettings : NSObject

//通用配置对象，用于设置默认参数
+ (CWNetworkSettings *)defaultSettings;

//最大连接个数
@property (nonatomic, assign) NSUInteger maxClientCount;
//每个连接最大请求个数
@property (nonatomic, assign) NSUInteger maxRequestCountPerClient;

//通用服务器，需要外部配置
@property (nonatomic, copy) NSString *commonBaseUrlString;
//通用请求体参数
@property (nonatomic, copy) NSMutableDictionary *commonBodyParameters;
//通用请求头参数
@property (nonatomic, copy) NSMutableDictionary *commonHeaderParameters;

//通用请求超时时长
@property (nonatomic, assign) NSTimeInterval commonTimeoutInterval;

@end
