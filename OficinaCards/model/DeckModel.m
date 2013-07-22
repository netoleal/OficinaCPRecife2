//
//  DeckModel.m
//  OficinaCards
//
//  Created by Neto Leal on 7/19/13.
//  Copyright (c) 2013 Neto Leal. All rights reserved.
//

#import "DeckModel.h"

@interface DeckModel( )
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation DeckModel

- (NSMutableArray *)cards
{
    if( !_cards )
    {
        _cards = [[NSMutableArray alloc] init];
        for (int rank = 1; rank <= [[CardModel validRanks] count] - 1; rank++)
        {
            for (NSString *suit in [CardModel validSuits])
            {
                CardModel *card = [[CardModel alloc] init];
                card.rank = rank;
                card.suit = suit;
                [_cards addObject:card];
            }
        }
    }
    
    return _cards;
}

- (CardModel *)drawRandomCard
{
    NSUInteger index = arc4random() % [self.cards count];
    CardModel *card = self.cards[ index ];
    [self.cards removeObjectAtIndex:index];
    return card;
}
@end
