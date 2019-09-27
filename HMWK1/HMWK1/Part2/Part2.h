//
//  Part2.h
//  HMWK1
//
//  Created by Leon Vladimirov on 9/27/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Part2 : NSObject

/**
 Filters an array by keyword.
 Must be used in try catch block to avoid passing wrong valued element.
 */
- (NSMutableArray<NSString *> *) filterArray: (NSMutableArray<NSString *> *) array byKeyword: (NSString *) keyword;

/**
 Returns a dict where the key is a string from the input array and the value is the amount of letters in the key.
 Must be used in try catch block to avoid passing wrong valued element.

 */

- (NSMutableDictionary *) convertStringArrayToDict: (NSMutableArray<NSString *> *) stringArray;

@end

NS_ASSUME_NONNULL_END
