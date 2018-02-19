//
//  AppDelegate.m
//  CWApp
//
//  Created by wangcw on 2018/1/18.
//  Copyright © 2018年 wangcw. All rights reserved.
//

#import "AppDelegate.h"
#import "CWTabBarController.h"
#import "RESideMenu.h"
#import "CWSideMenuViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController *mainTabVC = [[CWTabBarController alloc] init];
    CWSideMenuViewController *leftMenuVC = [[CWSideMenuViewController alloc] init];
    
    RESideMenu *sideMenu = [[RESideMenu alloc] initWithContentViewController:mainTabVC leftMenuViewController:leftMenuVC rightMenuViewController:nil];
    sideMenu.scaleContentView = NO;
    sideMenu.scaleMenuView = NO;
    sideMenu.scaleBackgroundImageView = NO;
    sideMenu.contentViewInPortraitOffsetCenterX = [UIScreen mainScreen].bounds.size.width/4;
    sideMenu.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    sideMenu.contentViewShadowColor = [UIColor blackColor];
    sideMenu.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenu.contentViewShadowOpacity = 0.6;
    sideMenu.contentViewShadowRadius = 12;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = sideMenu;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
