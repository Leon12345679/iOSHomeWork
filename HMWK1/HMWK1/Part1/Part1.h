//
//  Part1.h
//  HMWK1
//
//  Created by Leon Vladimirov on 9/27/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Part1 : NSObject


/**
 Returns a sorted array in ascending or descending order based on given boolean flag.
 Must be in try catch block since it works only with integer convertable types.
 */
- (NSMutableArray *) sortGivenArray: (NSMutableArray *) array ascending: (Boolean) ascending;

/**
 Returns an NSArray with values bigger than twenty.
 Must be in try catch block since it works only with integer convertable types.
 */
- (NSMutableArray<NSNumber *> *) returnArrayWithValuesBiggerThanTwenty: (NSMutableArray<NSNumber *> *) array;

/**
 Returns an NSArray with values divisible by 3.
 Must be in try catch block since it works only with integer convertable types.
 */

- (NSMutableArray<NSNumber *> *) returnArrayWithValuesDivisibleByThree: (NSMutableArray<NSNumber *> *) array;

@end

NS_ASSUME_NONNULL_END
