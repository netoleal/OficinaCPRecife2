//
//  CardCell.m
//  OficinaCards
//
//  Created by Neto Leal on 7/19/13.
//  Copyright (c) 2013 Neto Leal. All rights reserved.
//

#import "CardCell.h"

@interface CardCell( )
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end

@implementation CardCell

- (void)setCard:(CardModel *)card
{
    _card = card;
    self.contentLabel.text = card.contents;
    self.backgroundColor = card.unplayable? [UIColor grayColor]: [UIColor whiteColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
