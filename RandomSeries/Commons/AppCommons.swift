//
//  AppCommons.swift
//  RandomSeries
//
//  Created by WESTOWN on 27/07/2021.
//

import Foundation

class AppCommons
{

    
        //------------------------------------------//
        /* Commons - ViewController */
        
        let mainViewController = RandomSeriesVC() /* Ou SwiftReviewFirst */
                    
        //------------------------------------------//
        /* Singleton initialization*/
        
        static let shared = AppCommons()
        private init()
        {
            
        }
    
        //------------------------------------------//
}

