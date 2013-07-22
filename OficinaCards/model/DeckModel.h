//
//  DeckModel.h
//  OficinaCards
//
//  Created by Neto Leal on 7/19/13.
//  Copyright (c) 2013 Neto Leal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardModel.h"
@interface DeckModel : NSObject
- (CardModel *) drawRandomCard;
@end
