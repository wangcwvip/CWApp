//
//  CWNetworkService.h
//  CWApp
//
//  Created by wcw on 2018/2/24.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWRequest.h"

@interface CWNetworkService : NSObject

+ (CWNetworkService *)defaultService;

- (void)sendRequest:(CWRequest *)request;

- (void)startService;
- (void)stopService;

- (void)cancelRequestOfSender:(id)sender;
- (void)cancelRequestOfSender:(id)sender tag:(NSString *)tag;

@end
