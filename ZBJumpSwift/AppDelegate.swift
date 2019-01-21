//
//  AppDelegate.swift
//  ZBJumpSwift
//
//  Created by jumpapp1 on 2019/1/21.
//  Copyright © 2019年 zb. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //1、创建window
        window = UIWindow (frame: UIScreen.main.bounds)
        
        window?.backgroundColor = UIColor .white
        
        //2、创建根控制器
        
        window?.rootViewController = BaseTabBarViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }

   
}

