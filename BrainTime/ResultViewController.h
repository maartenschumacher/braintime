//
//  ResultViewController.h
//  BrainTime
//
//  Created by Maarten Schumacher on 01/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LevelViewController.h"

@interface ResultViewController : UIViewController

@property double difference;
@property NSInteger level;
@property LevelViewController *levelVC;

@end
