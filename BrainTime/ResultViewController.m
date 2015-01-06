//
//  ResultViewController.m
//  BrainTime
//
//  Created by Maarten Schumacher on 01/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UILabel *differenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedbackLabel;

@end

@implementation ResultViewController

-(void)viewDidAppear:(BOOL)animated {
    NSString *too = (self.difference > 0) ? @"late" : @"early";
    self.differenceLabel.text = [NSString stringWithFormat:@"%f seconds %@", self.difference, too];
}

- (IBAction)retryAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)nextLevelAction:(id)sender {
}

@end
