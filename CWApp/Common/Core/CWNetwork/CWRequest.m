//
//  CWRequest.m
//  CWApp
//
//  Created by wcw on 2018/2/24.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import "CWRequest.h"
#import "CWNetworkService.h"
#import "CWNetworkSettings.h"

@implementation CWRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _httpMethod = CWHTTPMethodPost;
        _headerParams = [[NSMutableDictionary alloc] init];
        _bodyParams = [[NSMutableDictionary alloc] init];
        
        CWNetworkSettings *commonSettings = [CWNetworkSettings defaultSettings];
        _baseServerUrl = commonSettings.commonBaseUrlString;
        _timeoutInterval = commonSettings.commonTimeoutInterval;
    }
    
    return self;
}

- (void)setHeaderValue:(NSString *)value forKey:(NSString *)key
{
    if ([key length] > 0)
    {
        if (value) {
            [_headerParams setValue:value forKey:key];
        }
        else {
            [_headerParams removeObjectForKey:key];
        }
    }
}

- (void)setBodyValue:(NSString *)value forKey:(NSString *)key
{
    if ([key length] > 0)
    {
        if (value) {
            [_bodyParams setValue:value forKey:key];
        }
        else {
            [_bodyParams removeObjectForKey:key];
        }
    }
}

- (NSString *)requestIdStr
{
    return [NSString stringWithFormat:@"%lu", [self hash]];
}

- (NSString *)requestString
{
    //生成请求串
    return @"";
}

- (void)sendWithSuccessBlock:(CWRequestSuccessBlock)successBlock failureBlock:(CWRequestFailureBlock)failureBlock
{
    _successBlock = successBlock;
    _failureBlock = failureBlock;
    [[CWNetworkService defaultService] sendRequest:self];
}

@end
