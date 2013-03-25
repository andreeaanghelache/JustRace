//
//  SocialViewController.m
//  JustRace
//
//  Created by Laborator iOS on 3/22/13.
//  Copyright (c) 2013 Laborator iOS. All rights reserved.
//

#import "SocialViewController.h"
#import "MainViewController.h"
#import <Parse/Parse.h>

@interface SocialViewController ()

@end

@implementation SocialViewController
@synthesize loginButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
   // [testObject setObject:@"bar" forKey:@"foo"];
   // [testObject save];
    
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"login-button-small.png"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginTouch:(id)sender {
    // The permissions requested from the user
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
      //  [_activityIndicator stopAnimating]; // Hide loading indicator
        
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            [self.navigationController pushViewController:[[MainViewController alloc] init] animated:YES];
        } else {
            NSLog(@"User with facebook logged in!");
            [self.navigationController pushViewController:[[MainViewController alloc] init] animated:YES];
        }
    }];
}

@end
