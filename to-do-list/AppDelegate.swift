//
//  AppDelegate.swift
//  to-do-list
//
//  Created by 田中　博成 on 2016/07/10.
//  Copyright © 2016年 hiropon. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITableViewDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 8.0, *) {
            // iOS8以上
            //forTypesは.Alertと.Soundと.Badgeがあります。
            let notiSettings = UIUserNotificationSettings(forTypes:[.Alert,.Sound,.Badge], categories:nil)
            application.registerUserNotificationSettings(notiSettings)
            application.registerForRemoteNotifications()
            
            if let notification = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification,let userInfo = notification.userInfo{
                application.applicationIconBadgeNumber = 0
                application.cancelLocalNotification(notification)
            }
            ////////以下略(通知許可の)
            return true
            
        } else{
            // iOS7以前
            application.registerForRemoteNotificationTypes( [.Alert,.Sound,.Badge] )
        }
        return true
    }
    
    
    //アプリがバックグラウンドに行ったときによばれるやつ
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        //ローカル通知
        let notification = UILocalNotification()
        //ロック中にスライドで〜〜のところの文字
        notification.alertAction = "アプリを開く"
        //通知の本文
        notification.alertBody = "\(myContentList.last!)"
        //通知される時間（とりあえず10秒後に設定）
        notification.fireDate = NSDate(timeIntervalSinceNow:5)
        //通知音
        notification.soundName = UILocalNotificationDefaultSoundName
        //アインコンバッジの数字
        notification.applicationIconBadgeNumber = 1
        //通知を識別するID
        notification.userInfo = ["notifyID":"gohan"]
        //通知をスケジューリング
        application.scheduleLocalNotification(notification)
        
    }
    
    
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        //アプリがactive時に通知を発生させた時にも呼ばれる
        if application.applicationState != .Active{
            //バッジを０にする
            application.applicationIconBadgeNumber = 0
            //通知領域から削除する
            application.cancelLocalNotification(notification)
        }else{
            if application.applicationIconBadgeNumber != 0{
                application.applicationIconBadgeNumber = 0
                application.cancelLocalNotification(notification)
            }
        }
    }
    
    
    
  
   
    
    
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

   

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

