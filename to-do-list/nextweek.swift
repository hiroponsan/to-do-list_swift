//
//  nextweek.swift
//  to-do-list
//
//  Created by 田中　博成 on 2016/07/17.
//  Copyright © 2016年 hiropon. All rights reserved.
//

import Foundation

class NextWeek {
    //次の月曜日
    class func MonDay() -> NSDate {
        //現在の日時を取得する
        let date = NSDate()
        let calender = NSCalendar.currentCalendar()
        let components = calender.components([.Year , .Month ,.Day , .Weekday], fromDate: date)
        let weekday = components.weekday  // 1が日曜日(week.swiftで設定)
        let hour = components.hour
        //通知する曜日を指定
        let fireWeekday = Week.Monday.rawValue
        let interval: NSTimeInterval
        //現在の日時から次の月曜日を算出
        if (weekday >= fireWeekday && hour >= 12) {
            interval = Double(60 * 60 * 24 * ((7 + fireWeekday) - weekday))
        } else {
            interval = Double(60 * 60 * 24 * (fireWeekday - weekday))
        }
        //通知する日時
        let nextDate = date.dateByAddingTimeInterval(interval)
        let fireDateComponents = calender.components([.Year , .Month ,.Day , .Weekday], fromDate: nextDate)
        //12時
        fireDateComponents.hour = 12
        //0分
        fireDateComponents.minute = 0
        //0秒
        fireDateComponents.second = 0
        
        return calender.dateFromComponents(fireDateComponents)!
    }
    
    class func SunDay() -> NSDate {
        //現在の日時を取得する
        let date = NSDate()
        let calender = NSCalendar.currentCalendar()
        let components = calender.components([.Year , .Month ,.Day , .Weekday], fromDate: date)
        let weekday = components.weekday  // 1が日曜日(week.swiftで設定)
        let hour = components.hour
        //通知する曜日を指定
        let fireWeekday = Week.Monday.rawValue
        let interval: NSTimeInterval
        //現在の日時から次の月曜日を算出
        if (weekday >= fireWeekday && hour >= 12) {
            interval = Double(60 * 60 * 24 * ((7 + fireWeekday) - weekday))
        } else {
            interval = Double(60 * 60 * 24 * (fireWeekday - weekday))
        }
        //通知する日時
        let nextDate = date.dateByAddingTimeInterval(interval)
        let fireDateComponents = calender.components([.Year , .Month ,.Day , .Weekday], fromDate: nextDate)
        //12時
        fireDateComponents.hour = 12
        //0分
        fireDateComponents.minute = 0
        //0秒
        fireDateComponents.second = 0
        
        return calender.dateFromComponents(fireDateComponents)!
    }
}