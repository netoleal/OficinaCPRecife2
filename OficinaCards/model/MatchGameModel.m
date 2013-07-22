//
//  MatchGameModel.m
//  OficinaCards
//
//  Created by Neto Leal on 7/19/13.
//  Copyright (c) 2013 Neto Leal. All rights reserved.
//

#import "MatchGameModel.h"

@implementation MatchGameModel
- (NSArray *)cards
{
    if( !_cards )
    {
        int max = 52;
        DeckModel *deck = [[DeckModel alloc] init];
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        
        for (int n = 0; n < max; n++)
        {
            [arr addObject:[deck drawRandomCard]];
        }
        
        _cards = [arr copy];
    }
    return _cards;
}

- (void)flipCard:(CardModel *)card
{
    if( !card.faceUp )
    {
        for (CardModel *otherCard in self.cards)
        {
            if( !otherCard.unplayable && otherCard.faceUp )
            {
                int score = 0;
                score = [card match:otherCard];
                if( score )
                {
                    otherCard.unplayable = YES;
                    card.unplayable = YES;
                }
                else
                {
                    otherCard.faceUp = NO;
                }
                
                self.score += score;
            }
        }
    }
    
    card.faceUp = !card.faceUp;
}
@end
