//
//  CWRequest.h
//  CWApp
//
//  Created by wcw on 2018/2/24.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWResponse.h"
#import "CWNetworkSettings.h"

typedef NS_ENUM(NSInteger, CWHTTPMethod)
{
    CWHTTPMethodGet = 0,
    CWHTTPMethodPost,
    CWHTTPMethodHead,
    CWHTTPMethodPut,
    CWHTTPMethodDelete,
    CWHTTPMethodPatch
};

typedef NS_ENUM(NSInteger, CWRequestSerializerType)
{
    CWRequestSerializerTypeHTTP = 0,
    CWRequestSerializerTypeJSON
};

typedef void (^CWRequestSuccessBlock)(CWResponse *response);
typedef void (^CWRequestFailureBlock)(NSError *error);
typedef void (^CWRequestProgressBlock)(NSProgress *progress);

NSString *const kRequestIdentityKey = @"CWRequestIdentityKey";

#define kNetworkServiceErrorDomain      @"CWNetworkFailureErrorDomain"
#define kNetworkBusinessErrorDomain     @"CWNetworkBusinessErrorDomain"

typedef NS_ENUM(NSInteger, CWNetworkErrorCode){
    NetworkServiceUnavailableError = 100,   //服务不可用
    NetworkRequestInvalidParamsError,       //参数不可用
    NetworkRequestRepeatedError,            //网络请求
    NetworkRequestQueueFullError,
    NetworkRequestUserStatusInvalidError,           //User invalid
    NetworkRequestNetworkNotReady
};

@interface CWRequest : NSObject

//请求方法，默认GET
@property (nonatomic, assign) CWHTTPMethod httpMethod;

//服务器URL，为空时使用commonSettings中参数
@property (nonatomic, copy) NSString *baseServerUrl;
//请求超时时长，不设置时使用commonSettings中参数
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

//功能路径，为具体请求路径
@property (nonatomic, copy) NSString *functionPath;

//请求头参数，默认不用单独设置
@property (nonatomic, copy) NSMutableDictionary *headerParams;
//请求体参数，具体的请求参数
@property (nonatomic, copy) NSMutableDictionary *bodyParams;

//发送者
@property (nonatomic, weak) id sender;
//请求标签
@property (nonatomic, copy) NSString *tag;

//请求成功回调
@property (nonatomic, readonly, copy) CWRequestSuccessBlock successBlock;
//请求失败回调
@property (nonatomic, readonly, copy) CWRequestFailureBlock failureBlock;

//单项设置
- (void)setBodyValue:(NSString *)value forKey:(NSString *)key;
- (void)setHeaderValue:(NSString *)value forKey:(NSString *)key;

//唯一标识该请求
- (NSString *)requestIdStr;

//获取请求串
- (NSString *)requestString;

//发送请求
- (void)sendWithSuccessBlock:(CWRequestSuccessBlock)successBlock failureBlock:(CWRequestFailureBlock)failureBlock;

@end
