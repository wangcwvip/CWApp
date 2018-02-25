//
//  CWNetworkService.m
//  CWApp
//
//  Created by wcw on 2018/2/24.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import "CWNetworkService.h"
#import "CWHttpClient.h"

@interface CWNetworkService()

@property (nonatomic, strong) NSMutableArray<CWHttpClient *> *clientArray;
@property (nonatomic, assign) NSUInteger maxClientCount;

@end

@implementation CWNetworkService

+ (CWNetworkService *)defaultService
{
    static CWNetworkService *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CWNetworkService alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSUInteger maxClientCount = [CWNetworkSettings defaultSettings].maxClientCount;
        if (maxClientCount < 1) {
            maxClientCount = 1;
        }
        _clientArray = [[NSMutableArray alloc] initWithCapacity:maxClientCount];
        
        NSUInteger maxRequestCountPerClient = [CWNetworkSettings defaultSettings].maxRequestCountPerClient;
        if (maxRequestCountPerClient < 1) {
            maxRequestCountPerClient = 3;
        }
    }
    return self;
}

- (CWHttpClient *)validClient
{
    CWHttpClient *httpClient = nil;
    //找到当前最闲的连接
    for (CWHttpClient *client in _clientArray) {
        if (httpClient == nil || [client requestCount] < [httpClient requestCount]) {
            httpClient = client;
        }
    }

    if (httpClient && httpClient.requestCount < httpClient.maxRequestCount) {
        
    }
}

- (CWHttpClient *)createClient
{
    if ([_clientArray count] >= _maxClientCount) {
        return nil;
    }
    
    CWNetworkSettings *commonSettings = [CWNetworkSettings defaultSettings];
    CWHttpClient *client = [[CWHttpClient alloc] init];
    client.baseUrlString = commonSettings.commonBaseUrlString;
    client.timeoutInterval = commonSettings.commonTimeoutInterval;
    client.commonBodyParams = commonSettings.commonBodyParameters;
    client.commonHeaderParams = commonSettings.commonHeaderParameters;
    client.maxRequestCount = commonSettings.maxRequestCountPerClient;


}

- (void)sendRequest:(CWRequest *)request
{
    //check
    if ([request.functionPath length] == 0) {
        if (request.failureBlock) {
            NSError *error = [NSError errorWithDomain:kNetworkServiceErrorDomain code:1 userInfo:@{NSLocalizedDescriptionKey: @"参数可能不对"}];
        }
    }
    
    //do
    
    //close
}

@end
