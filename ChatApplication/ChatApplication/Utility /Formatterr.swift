//
//  TimeFormatter.swift
//  TV9News
//
//  Created by Harish Singh on 27/02/23.
//

import Foundation
import CoreLocation

struct StaticVars {
       static var geoCoder = CLGeocoder()
       static var dateFormatter = DateFormatter()
   }
class MFormatter{
    func dateDiff(dateStr:String) -> String {
        var f:DateFormatter = DateFormatter()
        f.timeZone = NSTimeZone.local
          f.dateFormat = "HH:mm:ss.SSSZZZ"
            
        var now = f.string(from: NSDate() as Date)
        var startDate = f.date(from: dateStr) ?? Date()
        var endDate = f.date(from: now)!
        var calendar: NSCalendar = NSCalendar.current as NSCalendar
            
            let calendarUnits = Set<Calendar.Component>([.second, .minute, .hour, .day, .weekday, .month, .year])
            let dateComponents = Calendar.current.dateComponents(calendarUnits, from: startDate , to: endDate)
         
        let years = abs(dateComponents.year ?? Int())
        let months = abs(dateComponents.month ?? Int())
        let weeks = abs(dateComponents.weekOfMonth ?? Int())
        let days = abs(dateComponents.day ?? Int())
        let hours = abs(dateComponents.hour ?? Int())
        let min = abs(dateComponents.minute ?? Int())
        let sec = abs(dateComponents.second ?? Int())
            
            var timeAgo = ""

            if (sec > 0){
                if (sec > 1) {
                    timeAgo = "just now"
                } else {
                    timeAgo = "just now"
                }
            }
            
            if (min > 0){
                if (min > 1) {
                    timeAgo = "\(min) mins ago"
                } else {
                    timeAgo = "\(min) min ago"
                }
            }
            
            if(hours > 0){
                if (hours > 1) {
                    timeAgo = "\(hours) hours ago"
                } else {
                    timeAgo = "\(hours) hour ago"
                }
            }
            
            if (days > 0) {
                if (days > 1) {
                    timeAgo = "\(days) days ago"
                } else {
                    timeAgo = "YESTERDAY"
                }
            }
            
            if(weeks > 0){
                if (weeks > 1) {
                    timeAgo = "\(weeks) weeks ago"
                } else {
                    timeAgo = "\(weeks) week ago"
                }
            }
        
        if(months > 0){
            if (months > 1) {
                timeAgo = "\(months) months ago"
            } else {
                timeAgo = "\(months) month ago"
            }
        }
        
        if(years > 0){
            if (years > 1) {
                timeAgo = "\(years) years ago"
            } else {
                timeAgo = "\(years) year ago"
            }
        }
            
            
            print("timeAgo is===> \(timeAgo)")
            return timeAgo;
        }
        
    func dateDiffs(dateStr:String) -> String {
        var f:DateFormatter = DateFormatter()
        f.timeZone = NSTimeZone.local
            f.dateFormat = "yyyy-M-dd'T'HH:mm:ss.SSSZZZ"
            
        var now = f.string(from: NSDate() as Date)
        var startDate = f.date(from: dateStr) ?? Date()
        var endDate = f.date(from: now)!
        var calendar: NSCalendar = NSCalendar.current as NSCalendar
            
            let calendarUnits = Set<Calendar.Component>([.second, .minute, .hour, .day, .weekday, .month, .year])
            let dateComponents = Calendar.current.dateComponents(calendarUnits, from: startDate , to: endDate)
         
        let years = abs(dateComponents.year ?? Int())
        let months = abs(dateComponents.month ?? Int())
        let weeks = abs(dateComponents.weekOfMonth ?? Int())
        let days = abs(dateComponents.day ?? Int())
        let hours = abs(dateComponents.hour ?? Int())
        let min = abs(dateComponents.minute ?? Int())
        let sec = abs(dateComponents.second ?? Int())
         var timeAgo = ""
          print("timeAgo is===> \(timeAgo)")
          return timeAgo;
        }

}
