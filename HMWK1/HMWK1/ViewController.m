//
//  ViewController.m
//  HMWK1
//
//  Created by Leon Vladimirov on 9/27/19.
//  Copyright © 2019 Leon Vladimirov. All rights reserved.
//

#import "ViewController.h"
#import "Part1.h"
#import "Part2.h"

/**
    Contains both Part 1 and Part 2 of Homework 1.
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    #pragma mark Problem 1
    
//  Setup.
    Part1 * firstProblemSolution = [Part1 new];
    NSMutableArray * initialArray = [NSMutableArray arrayWithObjects:  @(3), @(6), @(32), @(24), @(81), nil];
    
// Creates an array with values bigger than twenty and prints them.
    @try
    {
        NSArray * biggerThanTwentyArray = [NSArray arrayWithArray: [firstProblemSolution returnArrayWithValuesBiggerThanTwenty: initialArray]];
        
        NSLog(@"%@", biggerThanTwentyArray);
    }
    @catch (NSException * exception)
    {
        NSLog(@"Failed with exception: %@", exception);
    }
    
// Adds all divisible by three elements to the initial array and sorts the array. Then prints it out.
    @try
    {
        [initialArray addObjectsFromArray: [firstProblemSolution returnArrayWithValuesDivisibleByThree: initialArray]];
        initialArray = [firstProblemSolution sortGivenArray: initialArray ascending: NO];
    }
    @catch (NSException * exception)
    {
        NSLog(@"Failed with exception: %@", exception);
    }

    
    NSLog(@"%@", initialArray);

    #pragma mark Problem 2
    
//  Setup.
    Part2 * secondProblemSolution = [Part2 new];
    NSMutableArray * stringArray = [NSMutableArray arrayWithObjects:  @"cataclism", @"catepillar", @"cat", @"teapot", @"truncate", nil];
    
// Outputs filtered array.
    @try
    {
        NSLog(@"%@", [secondProblemSolution filterArray: stringArray byKeyword: @"cat"]);
    }
    
    @catch (NSException * exception)
    {
        NSLog(@"Failed with exception: %@", exception);
    }

//  Outputs dict where the key is a word and the value is the number of letters in the key.
    @try
    {
        NSMutableDictionary * stringDict = [secondProblemSolution convertStringArrayToDict: stringArray];
        NSLog(@"%@", stringDict);
    }
    @catch (NSException * exception)
    {
        NSLog(@"Failed with exception: %@", exception);
    }
    
    // Do any additional setup after loading the view.
}



@end
