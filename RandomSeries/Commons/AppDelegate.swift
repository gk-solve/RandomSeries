//
//  AppDelegate.swift
//  RandomSeries
//
//  Created by WESTOWN on 27/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //---------------------------------------------------------------------------------------------------------------------------------//
             
        /* Initial VC launch using the AppCommons class (Singleton)  */
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = AppCommons.shared.mainViewController
        
        self.window?.makeKeyAndVisible()
        
        //---------------------------------------------------------------------------------------------------------------------------------//
        
        return true
    }

}

