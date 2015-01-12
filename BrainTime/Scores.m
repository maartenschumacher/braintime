//
//  Scores.m
//  BrainTime
//
//  Created by Maarten Schumacher on 09/01/15.
//  Copyright (c) 2015 Maarten Schumacher. All rights reserved.
//

#import "Scores.h"

@implementation Scores {
    NSArray *percentages;
    NSArray *feedback;
    NSArray *levelTimes;
}

+(Scores *)getInstance {
    static Scores *instance = nil;
    @synchronized(self) {
        if (instance == nil) {
            NSString *path = [Scores getFilePathForScores];
            if (![[NSFileManager defaultManager]fileExistsAtPath:path]) {
                instance = [[Scores alloc]init];
                [instance setHighscores:[[NSMutableArray alloc]init]];
                [instance setEnabledLevel:0];
                [instance makeData];
                [NSKeyedArchiver archiveRootObject:instance toFile:path];
                return instance;
            }
            instance = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
            [instance makeData];
        }
    }
    return instance;
}

-(void)makeData {
    levelTimes = @[@1,@2,@4,@8,@16,@30,@60,@1.5,@3.7,@0.8,@5.3,@4.2,@8.4,@2.9,@0.2];
    percentages = @[@.20, @.10, @.05, @.00001];
    feedback = @[@"You need to come closer to unlock the next level",@"Good job!",@"Great!",@"AMAZING"];
}

-(void)dealloc {
    [NSKeyedArchiver archiveRootObject:self toFile:[Scores getFilePathForScores]];
}

+(NSString *)getFilePathForScores {
    NSURL *documentDir = [[NSFileManager defaultManager]URLForDirectory:NSDocumentDirectory
                                                               inDomain:NSUserDomainMask
                                                      appropriateForURL:nil
                                                                 create:NO error:nil];
    NSURL *plist = [documentDir URLByAppendingPathComponent:@"scoresdata.plist"];
    return plist.path;
}

-(NSString *)getHighscoreForLevel:(NSInteger)level withNewScore:(double)score {
    if (level == self.highscores.count) {
        [self.highscores addObject:@(score)];
        return [NSString stringWithFormat:@"%f",score];
    }
    else if (level > self.highscores.count) {
        return @"error: user skipped level";
    }
    else {
        double oldscore = [self.highscores[level]doubleValue];
        if (fabs(score) < oldscore) {
            [self.highscores replaceObjectAtIndex:level withObject:@(score)];
            return [NSString stringWithFormat:@"%f",score];
        }
        else {
            return [NSString stringWithFormat:@"%f", oldscore];
        }
    }
}

-(NSString *)getFeedbackForLevel:(NSInteger)level withScore:(double)score {
    double positiveScore = fabs(score);
    for (int i = 0; i < percentages.count; i++) {
        double targetTime = [levelTimes[level] doubleValue];
        if (positiveScore > (targetTime * [percentages[i] doubleValue])) {
            if (i > 0) {
                self.enabledLevel++;
            }
            return feedback[i];
        }
    }
    return @"error";
}

-(double)getTargetTimeForLevel:(NSInteger)level {
    return [levelTimes[level] doubleValue];
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.highscores forKey:@"highscores"];
    [aCoder encodeObject:@(self.enabledLevel) forKey:@"enabledLevel"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _highscores = [[aDecoder decodeObjectForKey:@"highscores"]mutableCopy];
        _enabledLevel = [[aDecoder decodeObjectForKey:@"enabledLevel"] integerValue];
    }
    return self;
}

@end
