//
//  MatchGameModel.h
//  OficinaCards
//
//  Created by Neto Leal on 7/19/13.
//  Copyright (c) 2013 Neto Leal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeckModel.h"

@interface MatchGameModel : NSObject
@property (nonatomic) int score;
@property (nonatomic, strong) NSArray *cards;
- (void) flipCard:(CardModel *)card;
@end
