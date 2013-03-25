//
//  SocialViewController.m
//  JustRace
//
//  Created by Laborator iOS on 3/22/13.
//  Copyright (c) 2013 Laborator iOS. All rights reserved.
//

#import "SocialViewController.h"
#import <Parse/Parse.h>

@interface SocialViewController ()

@end

@implementation SocialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
