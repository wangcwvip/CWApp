//
//  CWNetworkSettings.m
//  CWApp
//
//  Created by wcw on 2018/2/24.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import "CWNetworkSettings.h"

@implementation CWNetworkSettings

+ (CWNetworkSettings *)defaultSettings
{
    static CWNetworkSettings *sharedSettings = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedSettings = [[CWNetworkSettings alloc] init];
    });
    
    return sharedSettings;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _maxClientCount = 3;
        _maxRequestCountPerClient = 5;
        _commonTimeoutInterval = 10;

        _commonBodyParameters = [[NSMutableDictionary alloc] init];
        _commonHeaderParameters = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}



@end
