//
//  CWUtilsMethod.h
//  CWApp
//
//  Created by wcw on 2018/2/17.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWUtilsMacros.h"

#pragma mark -- 获取颜色

UIColor* UIColorFromRGBA(UInt32 rgbValue, CGFloat alphaValue);
UIColor* UIColorFromRGB(UInt32 rgbValue);

BOOL isEmptyStr(NSString *str);
