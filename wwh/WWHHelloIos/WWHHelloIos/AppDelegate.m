//
//  AppDelegate.m
//  WWHHelloIos
//
//  Created by albert on 15/8/3.
//  Copyright (c) 2015年 sj.com.wwh. All rights reserved.
//

#import "AppDelegate.h"
#include "ViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 打印当前执行的方法名
    NSLog(@"%@", NSStringFromSelector(_cmd));
    // 创建UIWindow对象
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    //    self.window = [[UIWindow alloc] initWithFrame:frame];
    //   CGRect bound = [[UIScreen mainScreen] bounds];
   // NSLog(@"bound.x = %lf, bound.y = %lf, bound.height = %lf, bound.width = %lf", bound.origin.x, bound.origin.y, bound.size.height, bound.size.width);
   //   self.window = [[UIWindow alloc] initWithFrame:CGRectMake(50,  50, 200,  40)];
   // self.window = [[UIWindow alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    
    float scale = [[UIScreen mainScreen] scale];
    NSLog(@"scale = %lf", scale);
    
    
    
    
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end