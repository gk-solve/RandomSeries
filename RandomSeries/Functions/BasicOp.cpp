//
//  BasicOp.cpp
//  RandomSeries
//
//  Created by WESTOWN on 27/07/2021.
//

#include "BasicOp.hpp"

vector<int> BasicOp::fisherYatesAlgoCPP(int n)
{
    vector<int> vec;
    for(int k=0;k<n;++k){vec.push_back(k);}
    
    srand((unsigned int)time(NULL));
    
    for (int i = n-1; i != 0; i--)
    {
        int j = rand() % (i - 0 + 1);
        swap(vec[i],vec[j]);
    }
    
    return vec;
}
