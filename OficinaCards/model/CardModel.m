//
//  CardModel.m
//  OficinaCards
//
//  Created by Neto Leal on 7/19/13.
//  Copyright (c) 2013 Neto Leal. All rights reserved.
//

#import "CardModel.h"

@implementation CardModel

- (NSString *)contents
{
    if( !self.faceUp )
    {
        return @"";
    }
    return [NSString stringWithFormat:@"%@%@", [self rankAsString], self.suit];
}

- (NSString *)rankAsString
{
    return [CardModel validRanks][ self.rank ];
}

+ (NSArray *)validSuits
{
    return @[@"♠", @"♣", @"♥", @"♦" ];
}

+ (NSArray *)validRanks
{
    return @[@"?", @"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (int)match:(CardModel *)other
{
    if( self.rank == other.rank || [self.suit isEqualToString:other.suit])
    {
        return 1;
    }
    
    return 0;
}

@end
