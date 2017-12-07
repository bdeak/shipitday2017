//
//  AppDelegate.swift
//  Facetheperformance
//
//  Created by Dominik Kratky on 07.12.17.
//  Copyright © 2017 Dominik Kratky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let web = WebClass()
   
    
    let displayStatusChanged: CFNotificationCallback = { center, observer, name, object, info in
        let str = name!.rawValue as CFString
        if (str == "com.apple.springboard.lockcomplete" as CFString) {
            let isDisplayStatusLocked = UserDefaults.standard
            isDisplayStatusLocked.set(true, forKey: "isDisplayStatusLocked")
            isDisplayStatusLocked.synchronize()
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let isDisplayStatusLocked = UserDefaults.standard
        isDisplayStatusLocked.set(false, forKey: "isDisplayStatusLocked")
        isDisplayStatusLocked.synchronize()
        
        // Darwin Notification
        let cfstr = "com.apple.springboard.lockcomplete" as CFString
        let notificationCenter = CFNotificationCenterGetDarwinNotifyCenter()
        let function = displayStatusChanged
        CFNotificationCenterAddObserver(notificationCenter,
                                        nil,
                                        function,
                                        cfstr,
                                        nil,
                                        .deliverImmediately)
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        let isDisplayStatusLocked = UserDefaults.standard
        if let lock = isDisplayStatusLocked.value(forKey: "isDisplayStatusLocked"){
            // user locked screen
            if(lock as! Bool){
                
                // do anything you want here
                let exitStr = "Lock Button Pressed!"
                let exitStatus = UserDefaults.standard
                exitStatus.set(exitStr, forKey: "exitStatus")
                exitStatus.synchronize()
                print(exitStr)
                
            }
            else{
                
                // do anything you want here
                let exitStr = "Home Button Pressed!"
                let exitStatus = UserDefaults.standard
                exitStatus.set(exitStr, forKey: "exitStatus")
                exitStatus.synchronize()
                print(exitStr)
                
                let todoEndpoint: String = "https://gr2lqfx86d.execute-api.eu-central-1.amazonaws.com/prod/lock"
                guard let url = URL(string: todoEndpoint) else {
                    print("Error: cannot create URL")
                    return
                }
                _ = URLRequest(url: url)
                print("Lock API call sent")
                web.lockAction()
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateExitStatus"), object: nil)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Back to foreground.")
        web.unlockAction()
        
        //restore lock screen setting
        
        let isDisplayStatusLocked = UserDefaults.standard
        isDisplayStatusLocked.set(false, forKey: "isDisplayStatusLocked")
        isDisplayStatusLocked.synchronize()
        
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}
