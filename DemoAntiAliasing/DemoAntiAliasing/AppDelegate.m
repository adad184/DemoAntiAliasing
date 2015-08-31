//
//  AppDelegate.m
//  DemoAntiAliasing
//
//  Created by Ralph Li on 8/31/15.
//  Copyright © 2015 LJC. All rights reserved.
//

#import "AppDelegate.h"
#import "Example1Controller.h"
#import "Example2Controller.h"
#import "Example3Controller.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIViewController *vc1 = [Example1Controller new];
    UIViewController *vc2 = [Example2Controller new];
    UIViewController *vc3 = [Example3Controller new];
    vc1.tabBarItem.title = @"有锯齿";
    vc2.tabBarItem.title = @"透明边";
    vc3.tabBarItem.title = @"属性值";
    
    UITabBarController *tab = [UITabBarController new];
    tab.viewControllers = @[vc1,vc2,vc3];
    tab.view.backgroundColor = [UIColor whiteColor];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = tab;
    
    
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
