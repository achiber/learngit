
#import "AppDelegate.h"
#import "SJMainViewController.h"
#import "SJLoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"function%@ is calling", NSStringFromSelector(_cmd));
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[SJMainViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    SJLoginViewController *loginViewController = [[SJLoginViewController alloc] init];
    [self.window.rootViewController presentViewController:loginViewController animated:YES completion:^{
    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
     NSLog(@"function%@ is calling", NSStringFromSelector(_cmd));
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
     NSLog(@"function%@ is calling", NSStringFromSelector(_cmd));
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
     NSLog(@"function%@ is calling", NSStringFromSelector(_cmd));
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
     NSLog(@"function%@ is calling", NSStringFromSelector(_cmd));
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
     NSLog(@"function%@ is calling", NSStringFromSelector(_cmd));
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
