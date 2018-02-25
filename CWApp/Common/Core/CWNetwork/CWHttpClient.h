//
//  CWHttpClient.h
//  CWApp
//
//  Created by wcw on 2018/2/24.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWRequest.h"
#import "CWResponse.h"

@interface CWHttpClient : NSObject

@property (nonatomic, copy) NSString *baseUrlString;
@property (nonatomic, assign) NSTimeInterval timeoutInterval;
@property (nonatomic, copy) NSMutableDictionary *commonHeaderParams;
@property (nonatomic, copy) NSMutableDictionary *commonBodyParams;

@property (nonatomic, assign) NSUInteger maxRequestCount;

- (NSUInteger)requestCount;

- (void)sendRequest:(CWRequest *)request;

@end
