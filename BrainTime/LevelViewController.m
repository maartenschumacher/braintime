//
//  LevelViewController.m
//  BrainTime
//
//  Created by Maarten Schumacher on 01/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import "LevelViewController.h"
#import "ResultViewController.h"

@implementation LevelViewController {
    NSDate *start;
    NSDate *stop;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToResult"]) {
        stop = [[NSDate alloc]init];
        NSTimeInterval inputTime = [stop timeIntervalSinceDate:start];
        NSLog(@"%f", inputTime);
        double difference = inputTime - self.targetTime;
        [segue.destinationViewController setDifference:difference];
    }
}

- (IBAction)startAction:(id)sender {
    start = [[NSDate alloc]init];
    NSLog(@"%@", start);
}

- (IBAction)stopAction:(id)sender {
}


@end
