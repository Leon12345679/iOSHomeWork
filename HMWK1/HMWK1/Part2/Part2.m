//
//  Part2.m
//  HMWK1
//
//  Created by Leon Vladimirov on 9/27/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

#import "Part2.h"

@implementation Part2

- (NSMutableArray<NSString *> *) filterArray: (NSMutableArray<NSString *> *) array byKeyword: (NSString *) keyword
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat: [NSString stringWithFormat: @"SELF BEGINSWITH '%@'", keyword]];
    
    [array filterUsingPredicate: predicate];
    
    return array;
}

- (NSMutableDictionary *) convertStringArrayToDict: (NSMutableArray<NSString *> *) stringArray
{
    NSMutableDictionary * dict = [NSMutableDictionary new];
    
    for(NSString * string in stringArray)
    {
        NSUInteger wordCount = [string length];
        
        [dict setValue: [NSString stringWithFormat:@"%@",  @(wordCount)] forKey: string];
    }
    
    return dict;
}


@end
