/*
 *  FILENAME : BasicOpPack.mm
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "BasicOpPack.h"

#import "BasicOp.hpp"

@implementation BasicOpPack

-(NSMutableArray*)shuffledArrayWithElements:(int)n
{

    NSMutableArray *theShuffledArray = [[NSMutableArray alloc]init];
    
    /* Shuffle in C++ ... */
    BasicOp theBasicOp;
    vector<int> theVectorArray = theBasicOp.fisherYatesAlgoCPP(n);

    /* ... then convert the std::vector<int> to an NSMutableArray of NSNumber */
    for(auto it = theVectorArray.begin();it != theVectorArray.end();it++)
    {
        int theNumber = *it;
        [theShuffledArray addObject:[NSNumber numberWithInt:theNumber]];
        
        NSLog(@"the figure is %i",theNumber);
    }
    
    return theShuffledArray;
}

@end
