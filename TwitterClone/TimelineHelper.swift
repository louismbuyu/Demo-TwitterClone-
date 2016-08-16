//
//  TimelineHelper.swift
//  TwitterClone
//
//  Created by Louis Nelson Levoride on 12/08/16.
//  Copyright © 2016 LouisNelson. All rights reserved.
//

import Foundation
import UIKit

class Tweet {
    
    var profileImage: UIImage?
    var profileName: String?
    var timeStamp: NSDate!
    var postText: String?
    var postImage: UIImage?
    var retweets: Int?
    var likes: Int?
    var likedbyYou: Bool?
    var retweetedByYou:Bool?
}

class simpleDate {
    
    func date(date: NSDate) -> String{
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "h:mm a"
        
        let elapsedTimeInSeconds = NSDate().timeIntervalSinceDate(date)
        
        let secondInDays: NSTimeInterval = 60 * 60 * 24
        
        if elapsedTimeInSeconds > 7 * secondInDays {
            dateFormatter.dateFormat = "MM/dd/yy"
        } else if elapsedTimeInSeconds > secondInDays {
            dateFormatter.dateFormat = "EEE"
        }
        
        return dateFormatter.stringFromDate(date)
    }
}