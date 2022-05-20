//
//  AppDelegate.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let liveNews = RecipesRouter.createModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = liveNews
        window?.makeKeyAndVisible()
        
        return true
    }

   
}

