//
//  AppDelegate.swift
//  SampleTestApp
//
//  Created by Tejeshwar Singh Gill on 3/1/19.
//  Copyright © 2019 Personal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coreDataStack = CoreDataStack.shared

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initializeStartingView()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    fileprivate func initializeStartingView() {
        if let tabBarViewController = window?.rootViewController as? UITabBarController {
            let service = RealEstateServiceImpl()
            let coredataSyncCordinator = CoreDataSyncCordinator(persistentContainer: coreDataStack.persistentContainer)
            let viewModel = RealEstateViewModel(service: service, syncCordinator: coredataSyncCordinator)
            
            let homeViewController = tabBarViewController.children[0] as? ViewController
            let favoriteController = tabBarViewController.children[1] as? ViewController
            
            homeViewController?.viewModel = viewModel
            homeViewController?.title = "Estate List"
            homeViewController?.tabBarItem.image = UIImage(named: "homeicon")
            homeViewController?.type = ViewControllerType.MainViewController
            
            favoriteController?.viewModel = viewModel
            favoriteController?.title = "Favorites"
            favoriteController?.tabBarItem.image = UIImage(named: "fav")
            favoriteController?.type = ViewControllerType.FavoriteViewController
            
            tabBarViewController.selectedIndex = 0
        }
    }
}

