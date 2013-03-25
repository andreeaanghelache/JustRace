//
//  SocialAppDelegate.m
//  JustRace
//
//  Created by Laborator iOS on 3/22/13.
//  Copyright (c) 2013 Laborator iOS. All rights reserved.
//

#import "SocialAppDelegate.h"

#import "SocialViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@implementation SocialAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"Q3ybuwHrHMwSAd8u1CQC0b0iRiF0D8WEZ0vERoiI"
                  clientKey:@"AeZKQ91NUnFcHnuzBIiySoOf0s1MiQlUrdR7ZbY7"];
    [PFFacebookUtils initializeWithApplicationId:@"371635172951534"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[SocialViewController alloc] initWithNibName:@"SocialViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
      [FBSession.activeSession handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [FBSession.activeSession close];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}

@end
