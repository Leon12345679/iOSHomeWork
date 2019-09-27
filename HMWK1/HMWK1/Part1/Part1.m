//
//  Part1.m
//  HMWK1
//
//  Created by Leon Vladimirov on 9/27/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

#import "Part1.h"

@implementation Part1

- (NSMutableArray *) sortGivenArray: (NSMutableArray *) array ascending: (Boolean) ascending
{
    NSSortDescriptor * sortOrder;
    
    if(ascending) {
        sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: YES];
    }
    else {
        sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO];
    }

    NSArray * temp = [array sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
    return [NSMutableArray arrayWithArray: temp];

}

- (NSArray<NSNumber *> *) returnArrayWithValuesBiggerThanTwenty: (NSArray<NSNumber *> *) array
{
    NSMutableArray * biggerThanTwentyArray = [NSMutableArray new];
    
    for(NSNumber * number in array) {

        if(number.integerValue >= 20)
        {
            [biggerThanTwentyArray addObject: number];
        }

    }
    
    return [NSArray arrayWithArray: biggerThanTwentyArray];
}


- (NSArray<NSNumber *> *) returnArrayWithValuesDivisibleByThree: (NSArray<NSNumber *> *) array
{
    NSMutableArray * divisibleByThreeArray = [NSMutableArray new];
    
    for(NSNumber * number in array) {
     
        if(number.integerValue % 3 == 0)
        {
            [divisibleByThreeArray addObject: number];
        }

    }
    
    return [NSArray arrayWithArray: divisibleByThreeArray];
}

@end
