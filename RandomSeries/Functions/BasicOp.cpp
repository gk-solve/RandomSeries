/*
 *  FILENAME : BasicOp.cpp
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#include "BasicOp.hpp"

vector<int> BasicOp::fisherYatesAlgoCPP(int n)
{
    /* Start from the ordered sequence 0, 1, ..., n-1 */
    vector<int> vec;
    for(int k=0;k<n;++k){vec.push_back(k);}

    /* Seeded with the current time (1 s resolution) */
    srand((unsigned int)time(NULL));

    /* Walk from the end : swap each element with a random one at or before it */
    for (int i = n-1; i != 0; i--)
    {
        int j = rand() % (i - 0 + 1);
        swap(vec[i],vec[j]);
    }
    
    return vec;
}
