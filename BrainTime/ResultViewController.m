//
//  ResultViewController.m
//  BrainTime
//
//  Created by Maarten Schumacher on 01/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import "ResultViewController.h"
#import "Scores.h"

@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UILabel *differenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedbackLabel;
@property (weak, nonatomic) IBOutlet UILabel *highscoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *nextLevelButton;

@end

@implementation ResultViewController

-(void)viewWillAppear:(BOOL)animated {
    NSString *too = (self.difference > 0) ? @"late" : @"early";
    self.differenceLabel.text = [NSString stringWithFormat:@"%f seconds %@", self.difference, too];
    Scores *scoresInstance = [Scores getInstance];
    self.highscoreLabel.text = [scoresInstance getHighscoreForLevel:self.level withNewScore:self.difference];
    self.feedbackLabel.text = [scoresInstance getFeedbackForLevel:self.level withScore:self.difference];
    if ((self.level + 1) <= [scoresInstance enabledLevel]) {
        self.nextLevelButton.enabled = YES;
    }
    else {
        self.nextLevelButton.enabled = NO;
    }
}

- (IBAction)retryAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)nextLevelAction:(id)sender {
    self.levelVC.level++;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
