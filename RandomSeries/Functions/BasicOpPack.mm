//
//  BasicOpPack.m
//  RandomSeries
//
//  Created by WESTOWN on 27/07/2021.
//

#import <Foundation/Foundation.h>
#import "BasicOpPack.h"

#import "BasicOp.hpp"

@implementation BasicOpPack

-(NSMutableArray*)shuffledArrayWithElements:(int)n
{

    NSMutableArray *theShuffledArray = [[NSMutableArray alloc]init];
    
    BasicOp theBasicOp;
    vector<int> theVectorArray = theBasicOp.fisherYatesAlgoCPP(n);
    
    for(auto it = theVectorArray.begin();it != theVectorArray.end();it++)
    {
        int theNumber = *it;
        [theShuffledArray addObject:[NSNumber numberWithInt:theNumber]];
        
        NSLog(@"the figure is %i",theNumber);
    }
    
    return theShuffledArray;
}

@end
