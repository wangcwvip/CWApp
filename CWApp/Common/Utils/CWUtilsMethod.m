//
//  CWUtilsMethod.m
//  CWApp
//
//  Created by wcw on 2018/2/17.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import "CWUtilsMethod.h"

UIColor* UIColorFromRGBA(UInt32 rgbValue, CGFloat alphaValue)
{
    CGFloat r = (float)((rgbValue & 0xFF0000) >> 16)/255.0;
    CGFloat g = ((float)((rgbValue & 0xFF00) >> 8))/255.0;
    CGFloat b = ((float)(rgbValue & 0xFF))/255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:alphaValue];
}

UIColor* UIColorFromRGB(UInt32 rgbValue)
{
    return UIColorFromRGBA(rgbValue, 1.0f);
}

BOOL isEmptyStr(NSString *str)
{
    return (str != nil && [str length] > 0);
}
