//
//  AppCommons.swift
//  RandomSeries
//
//  Created by WESTOWN on 27/07/2021.
//

import Foundation
import UIKit
import CoreGraphics

class AppCommons
{
        //------------------------------------------//
        /* Commons - ViewController */
        
        let mainViewController = RandomSeriesVC() /* Ou SwiftReviewFirst */
    
        //------------------------------------------//
        /* Commons - colors */
        
        let darkerBlue = UIColor(red: 0.10, green: 0.10, blue: 0.50, alpha: 1.0)
        let darkerGreen = UIColor(red: 0.00, green: 0.39, blue: 0.00, alpha: 1.0)

        //------------------------------------------//
        /* Commons - fonts */
            
        let lightFont = "Avenir-Light"
        let mainFont = "Avenir-Medium"
        let heavyFont = "Avenir-Black"
        let obliqueFont = "Avenir-Oblique"
        
        var mainPoliceDim:CGFloat = 10
        
        //------------------------------------------//
        /* Commons - dimensions */

        var objectWidth:CGFloat = 10
        var objectHeight:CGFloat = 10
    
        //------------------------------------------//
        /* Singleton initialization*/
        
        static let shared = AppCommons()
        private init()
        {
            let width = UIScreen.main.bounds.width
            //let height = UIScreen.main.bounds.height
            
            print ("Screen width: \(width)")
            
            if width >= 320 && width < 375
            {
                objectWidth = 20
                objectHeight = 20
                mainPoliceDim = 10
            }
            else if width >= 375 && width < 820
            {
                objectWidth = 25
                objectHeight = 25
                mainPoliceDim = 11
            }
            else if width >= 820 && width < 1200
            {
                objectWidth = 25
                objectHeight = 25
                mainPoliceDim = 24
            }
            else
            {
                objectWidth = 20
                objectHeight = 20
                mainPoliceDim = 12
            }
            
        }
    
        //------------------------------------------//
}

