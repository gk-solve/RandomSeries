/*
 *  FILENAME : BasicOp.hpp
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#ifndef BasicOp_hpp
#define BasicOp_hpp

#include <stdio.h>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm> // inclut std::sort

using namespace std;

/* Pure C++ helpers, exposed to Swift through BasicOpPack (Objective-C++) */
class BasicOp
{
    public:
    /* Returns a random permutation of 0 ... n-1 (Fisher-Yates shuffle) */
    vector<int> fisherYatesAlgoCPP(int n);
};

#endif /* BasicOp_hpp */
