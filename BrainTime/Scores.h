//
//  Scores.h
//  BrainTime
//
//  Created by Maarten Schumacher on 09/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scores : NSObject <NSCoding>

@property NSMutableArray *highscores;
@property NSInteger enabledLevel;

+(Scores *)getInstance;

-(NSString *)getHighscoreForLevel:(NSInteger)level withNewScore:(double)score;
-(NSString *)getFeedbackForLevel:(NSInteger)level withScore:(double)score;
-(double)getTargetTimeForLevel:(NSInteger)level;


@end
