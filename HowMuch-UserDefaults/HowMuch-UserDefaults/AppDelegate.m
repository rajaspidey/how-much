//
//  AppDelegate.m
//  HowMuch-UserDefaults
//
//  Created by Daniel Khamsing on 6/9/16.
//  Copyright © 2016 Daniel Khamsing. All rights reserved.
//

#import "AppDelegate.h"

#import "ListController.h"
#import "UserDefaultsStorage.h"

static NSString * const hm_ud_list = @"hm_ud_list";

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = ({
        UserDefaultsStorage *storage = [[UserDefaultsStorage alloc] initWithKey:hm_ud_list];
//        [storage debugClean];

        ListCoordinator *coordinator = [ListCoordinator coreViewModel];
        coordinator.overrideSignIn = YES;
        coordinator.storage = storage;

        ListController *viewController = [[ListController alloc] init];
        viewController.coordinator = coordinator;

        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        navigationController;
    });
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
