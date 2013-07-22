//
//  CardModel.h
//  OficinaCards
//
//  Created by Neto Leal on 7/19/13.
//  Copyright (c) 2013 Neto Leal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardModel : NSObject
@property (nonatomic) int rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic, readonly) NSString *contents;
@property (nonatomic) BOOL faceUp;
@property (nonatomic) BOOL unplayable;

- (int) match:(CardModel *)other;
+ (NSArray *)validRanks;
+ (NSArray *)validSuits;
@end
