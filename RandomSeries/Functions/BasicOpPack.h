/*
 *  FILENAME : BasicOpPack.h
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import <Foundation/Foundation.h>

/* Objective-C facade over the C++ BasicOp class, so Swift can call it (see RandomSeries-Bridging-Header.h) */
@interface BasicOpPack : NSObject

/* Random permutation of 0 ... n-1 as NSNumbers ; seen from Swift as shuffledArray(withElements:) */
-(NSMutableArray*)shuffledArrayWithElements:(int)n;

@end


