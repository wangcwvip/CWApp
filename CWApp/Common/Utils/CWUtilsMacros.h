//
//  CWUtilsMacro.h
//  CWApp
//
//  Created by wcw on 2018/2/17.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#ifndef CWUtilsMacros_h
#define CWUtilsMacros_h

#pragma mark -- 系统对象

//APP常用对象宏
#define kAppScreen              [UIScreen mainScreen]
#define kApplication            [UIApplication sharedApplication]
#define kAppDelegate            ((AppDelegate *)kApplication.delegate)
#define kAppWindow              kAppDelegate.window
#define kAppRootVC              kAppWindow.rootViewController
#define kAppUserDefaults        [NSUserDefaults standardUserDefaults]
#define kAppNotificationCenter  [NSNotificationCenter defaultCenter]

//手机固件判断
#define iOSVersion  ([[[UIDevice currentDevice] systemVersion] floatValue])
#define iOSEqual(version)           (fabsf(iOSVersion-version) < 0.001)
#define iOSLess(version)            ((iOSVersion-version) < 0.01)
#define iOSLessEqual(version)       (iOSEqual(version) || iOSLess(version))
#define iOSGreater(version)         ((iOSVersion-version) > 0.01)
#define iOSGreaterEqual(version)    (iOSEqual(version) || iOSGreater(version))
#define IS_IOS11 iOSGreaterEqual(11.0f)

#pragma mark -- 常用尺寸

//常见组件尺寸
#define STATUSBAR_HEIGHT        [kApplication statusBarFrame].size.height
#define NAVIGATIONBAR_HEIGHT    44.0f
#define TABBAR_HEIGHT           (STATUSBAR_HEIGHT>20.f? 83.f:49.f)
#define PAGE_HEADER_HEIGHT      (STATUSBAR_HEIGHT+NAVIGATIONBAR_HEIGHT)

//屏幕宽高
#define kScreenBounds   kAppScreen.bounds
#define kScreenSize     kScreenBounds.size
#define SCREEN_WIDTH    kScreenSize.width
#define SCREEN_HEIGHT   kScreenSize.height

#pragma mark -- 常用手机尺寸

//手机尺寸
#define IPHONEX_WIDTH       375.f
#define IPHONEX_HEIGHT      812.f
#define IPHONEX_SIZE        CGSizeMake(IPHONEX_WIDTH, IPHONEX_HEIGHT)
#define IPHONEX_SIZE_PX     CGSizeMake(1125.f, 2436.f)
#define IPHONE6P_WIDTH      375.f
#define IPHONE6P_HEIGHT     667.f
#define IPHONE6P_SIZE       CGSizeMake(IPHONE6P_WIDTH, IPHONE6P_HEIGHT)
#define IPHONE6P_SIZE_PX    CGSizeMake(1242.f, 2208.f)
#define IPHONE6_WIDTH       414.f
#define IPHONE6_HEIGHT      736.f
#define IPHONE6_SIZE        CGSizeMake(IPHONE6_WIDTH, IPHONE6_HEIGHT)
#define IPHONE6_SIZE_PX     CGSizeMake(750.f, 1334.f)
#define IPHONE5_WIDTH       320.f
#define IPHONE5_HEIGHT      568.f
#define IPHONE5_SIZE        CGSizeMake(IPHONE5_WIDTH, IPHONE5_HEIGHT)
#define IPHONE5_SIZE_PX     CGSizeMake(640.f, 1136.f)
#define IPHONE4_WIDTH       320.f
#define IPHONE4_HEIGHT      480.f
#define IPHONE4_SIZE        CGSizeMake(IPHONE4_WIDTH, IPHONE4_HEIGHT)
#define IPHONE4_SIZE_PX     CGSizeMake(640.f, 960.f)

//手机尺寸判断
#define CURRENTMODE_SIZE    ([[UIScreen mainScreen] currentMode].size)
#define IS_IPHONE5_SIZE     CGSizeEqualToSize(IPHONE5_SIZE_PX, CURRENTMODE_SIZE)
#define IS_IPHONE6_SIZE     CGSizeEqualToSize(IPHONE6_SIZE_PX, CURRENTMODE_SIZE)
#define IS_IPHONE6P_SIZE    CGSizeEqualToSize(IPHONE6P_SIZE_PX, CURRENTMODE_SIZE)
#define IS_IPHONEX_SIZE     CGSizeEqualToSize(IPHONEX_SIZE_PX, CURRENTMODE_SIZE)

#pragma mark -- 适配比例

//用于适配
#define WIDTH_SCALE_IPHONE6     (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))/(IPHONE6_WIDTH)
#define HEIGHT_SCALE_IPHONE6    (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))/(IPHONE6_HEIGHT)

//根据IPhone6尺寸适配
#define ScaleWidth(width)   (width*WIDTH_SCALE_IPHONE6)
#define ScaleHeight(height) (height*HEIGHT_SCALE_IPHONE6)

#endif /* CWUtilsMacros_h */
