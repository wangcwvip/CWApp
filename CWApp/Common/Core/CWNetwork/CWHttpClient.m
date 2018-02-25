//
//  CWHttpClient.m
//  CWApp
//
//  Created by wcw on 2018/2/24.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import "CWHttpClient.h"
#import "AFHTTPSessionManager.h"

@interface CWHttpClient()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic, strong) NSMutableArray<CWRequest *> *requestArray;

@end

@implementation CWHttpClient

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [self createSessionManager];
    }
    
    return _sessionManager;
}

- (AFHTTPSessionManager *)createSessionManager
{
    NSURL *baseUrl = [NSURL URLWithString:_baseUrlString];
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    requestSerializer.HTTPShouldHandleCookies = NO;
    requestSerializer.timeoutInterval = _timeoutInterval;
    sessionManager.requestSerializer = requestSerializer;
    
    AFJSONResponseSerializer *responseSerialzer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves|NSJSONReadingAllowFragments];
    responseSerialzer.removesKeysWithNullValues = YES;
    sessionManager.responseSerializer = responseSerialzer;
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    securityPolicy.allowInvalidCertificates = NO;
    securityPolicy.validatesDomainName = YES;
    sessionManager.securityPolicy = securityPolicy;
    
    NSArray *allKeys = [_commonHeaderParams allKeys];
    for (NSString *key in allKeys) {
        [sessionManager.requestSerializer setValue:[_commonHeaderParams objectForKey:key] forHTTPHeaderField:key];
    }
    
    __weak typeof(self) wSelf = self;
    [sessionManager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable __autoreleasing * _Nullable error) {
        NSString *requestId = [parameters objectForKey:kRequestIdentityKey];
        CWRequest *currentRequest = [wSelf requestForId:requestId];
        if (currentRequest) {
            return [currentRequest requestString];
        }
        else {
            return @"";
        }
    }];
    
    return sessionManager;
}

- (CWRequest *)requestForId:(NSString *)requestId
{
    for (CWRequest *request in self.requestArray) {
        if ([requestId isEqualToString:[request requestIdStr]]) {
            return request;
        }
    }
    
    return nil;
}

- (void)prepareForRequest:(CWRequest *)request
{
    if (request == nil) {
        return;
    }
    
    if (request.timeoutInterval > 0.1) {
        self.sessionManager.requestSerializer.timeoutInterval = request.timeoutInterval;
    }
}

- (void)sendRequest:(CWRequest *)request
{
    NSString *requestStr = [request requestString];
    
    [self.sessionManager POST:requestStr parameters:request.bodyParams progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}


@end
