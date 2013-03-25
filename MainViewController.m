//
//  MainViewController.m
//  JustRace
//
//  Created by Laborator iOS on 3/25/13.
//  Copyright (c) 2013 Laborator iOS. All rights reserved.
//

#import "MainViewController.h"
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize picture;
@synthesize nameLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Create request for user's Facebook data
    FBRequest *request = [FBRequest requestForMe];
    
    // Send request to Facebook
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
            // result is a dictionary
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            NSURL *pictureURL;
            NSDictionary *userProfile = @{
                                          @"facebookId": facebookID,
                                          @"name": userData[@"name"],
                                          @"location": userData[@"location"][@"name"],
                                          @"gender": userData[@"gender"],
                                          @"birthday": userData[@"birthday"],
                                          @"pictureURL": [pictureURL absoluteString]
                                          };
            NSLog(@"%@",userData[@"name"]);
            [self.nameLabel setText:userData[@"id"]];
            [self.picture setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:pictureURL]]];
            
        }
    ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
