

#import "AppDelegate.h"
#import "WWHFirstViewController.h"
#import "WWHSecondViewController.h"
#import "WWHThirdViewController.h"
#import "WWHForthViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 初始化四个试图控制器
    WWHFirstViewController *firstViewController = [[WWHFirstViewController alloc] init];
    WWHSecondViewController *secondViewController = [[WWHSecondViewController alloc] init];
    WWHThirdViewController *thirdViewController = [[WWHThirdViewController alloc] init];
    WWHForthViewController *forthViewController = [[WWHForthViewController alloc] init];
    
    // 初始化页签栏控制器，作为上面四个试图控制器的容器
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[firstViewController, secondViewController, thirdViewController, forthViewController];
    
    UIFont *tabBarFont = [UIFont fontWithName:nil size:11];
    
    NSMutableDictionary *stateNormalTitleTextAttributes = [NSMutableDictionary dictionary];
    [stateNormalTitleTextAttributes setObject:tabBarFont forKey:NSFontAttributeName];
    
    NSMutableDictionary *stateSelectedTitleTextAttributes = [NSMutableDictionary dictionary];
    [stateNormalTitleTextAttributes setObject:tabBarFont forKey:NSFontAttributeName];
    
    // 分别设置四个页签的样式
    UITabBarItem *tabBarItem1 = [tabBarController.tabBar.items objectAtIndex:0];
    tabBarItem1.title = @"1";
    tabBarItem1.image = [[UIImage imageNamed:@"IconTabBarItemMessageDefault"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"IconTabBarItemMessageSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem2 = [tabBarController.tabBar.items objectAtIndex:1];
    tabBarItem2.title = @"2";
    tabBarItem2.image = [[UIImage imageNamed:@"IconTabBarItemContactDefault"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"IconTabBarItemContactSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem3 = [tabBarController.tabBar.items objectAtIndex:2];
    tabBarItem3.title = @"3";
    tabBarItem3.image = [[UIImage imageNamed:@"IconTabBarItemMicroblogDefault"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"IconTabBarItemMicroblogSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem4 = [tabBarController.tabBar.items objectAtIndex:3];
    tabBarItem4.title = @"4";
    tabBarItem4.image = [[UIImage imageNamed:@"IconTabBarItemMoreDefault"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem4.selectedImage = [[UIImage imageNamed:@"IconTabBarItemMoreSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 统一设置四个页签相同的样式
    for (UITabBarItem *tabBarItem in tabBarController.tabBar.items) {
        [tabBarItem setTitleTextAttributes:stateNormalTitleTextAttributes forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:stateSelectedTitleTextAttributes forState:UIControlStateSelected];
        [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
