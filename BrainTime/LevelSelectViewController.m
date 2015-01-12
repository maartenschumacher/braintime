//
//  LevelSelectViewController.m
//  BrainTime
//
//  Created by Maarten Schumacher on 01/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import "LevelSelectViewController.h"
#import "LevelViewController.h"
#import "Scores.h"

@interface LevelSelectViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *levelButtons;

@end

@implementation LevelSelectViewController

-(void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBar.topItem.title = @"Level Select";
}

-(void)viewWillAppear:(BOOL)animated {
    Scores *scoresInstance = [Scores getInstance];
    for (UIButton *levelButton in self.levelButtons) {
        if ([levelButton tag] > scoresInstance.enabledLevel) {
            levelButton.enabled = NO;
        }
        else {
            levelButton.enabled = YES;
        }
    }
}

-(void)viewWillLayoutSubviews {
    for (UIButton *levelButton in self.levelButtons) {
        //levelButton.titleLabel.text = [NSString stringWithFormat:@"Level %li", (long)([levelButton tag] + 1)];
        [levelButton setTitle:[NSString stringWithFormat:@"Level %li", (long)([levelButton tag] + 1)] forState:UIControlStateNormal];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToLevel"]) {
        [segue.destinationViewController setLevel:[sender tag]];
    }
}

- (IBAction)didSelectLevel:(id)sender {
    [self performSegueWithIdentifier:@"segueToLevel" sender:sender];
}


@end
