//
//  LevelSelectViewController.m
//  BrainTime
//
//  Created by Maarten Schumacher on 01/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import "LevelSelectViewController.h"
#import "LevelViewController.h"

@implementation LevelSelectViewController

-(void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBar.topItem.title = @"Level Select";
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToLevel"]) {
        [segue.destinationViewController setTargetTime:1.0];
    }
}

@end
