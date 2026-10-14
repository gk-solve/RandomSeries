/*
 *  FILENAME : AppDelegate.swift
 *  APPID : eu.soleriant.RandomSeries
 *  CREATION DATE : 2021, July 27th
 *  AUTHOR : GK
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //---------------------------------------------------------------------------------------------------------------------------------//
             
        /* Initial VC launch using the AppCommons class (Singleton)  */
        /* The window is created in code : Info.plist declares no main storyboard and no scene manifest, so SceneDelegate is not used */
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = AppCommons.shared.mainViewController
        
        self.window?.makeKeyAndVisible()
        
        //---------------------------------------------------------------------------------------------------------------------------------//
        
        return true
    }

}

