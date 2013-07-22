//
//  CardGameViewController.m
//  OficinaCards
//
//  Created by Neto Leal on 7/19/13.
//  Copyright (c) 2013 Neto Leal. All rights reserved.
//

#import "CardGameViewController.h"
#import "MatchGameModel.h"
#import "CardCell.h"

@interface CardGameViewController ()
@property (nonatomic, strong) MatchGameModel *game;
@end

@implementation CardGameViewController

- (MatchGameModel *)game
{
    if( !_game )
    {
        _game = [[MatchGameModel alloc] init];
    }
    return _game;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.game.cards count];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cardCell" forIndexPath:indexPath];
    CardModel *card = self.game.cards[ indexPath.row ];
    cell.card = card;
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CardModel *card = self.game.cards[ indexPath.row ];
    CardCell *cell = (CardCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if( !card.unplayable )
    {
        [self.game flipCard:card];
        [UIView transitionWithView:cell duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            cell.card = card;
        } completion:^(BOOL finished) {
            [self updateUI];
        }];
    }
}

- (void) updateUI
{
    [self.collectionView reloadData];
    self.title = [NSString stringWithFormat:@"Score: %i", self.game.score];
    //@netoleal
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
