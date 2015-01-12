//
//  LevelViewController.m
//  BrainTime
//
//  Created by Maarten Schumacher on 01/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import "LevelViewController.h"
#import "ResultViewController.h"
#import "Scores.h"

@interface LevelViewController ()

@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;

@end

@implementation LevelViewController {
    NSDate *start;
    NSDate *stop;
}

-(void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBar.topItem.title = [NSString stringWithFormat:@"Level %li", (self.level + 1)];
}

-(void)viewWillAppear:(BOOL)animated {
    self.targetTime = [[Scores getInstance] getTargetTimeForLevel:self.level];
    self.instructionLabel.text = [NSString stringWithFormat:@"Press stop after %f seconds", self.targetTime];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToResult"]) {
        stop = [[NSDate alloc]init];
        NSTimeInterval inputTime = [stop timeIntervalSinceDate:start];
        double difference = inputTime - self.targetTime;
        [segue.destinationViewController setDifference:difference];
        [segue.destinationViewController setLevel:self.level];
        [segue.destinationViewController setLevelVC:self];
    }
}

- (IBAction)startAction:(id)sender {
    start = [[NSDate alloc]init];
}

- (IBAction)stopAction:(id)sender {
}


@end
