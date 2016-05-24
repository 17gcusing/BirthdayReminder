//
//  CurrentList.swift
//  Birthday Reminder
//
//  Created by Gwen Cusing on 4/13/16.
//  Copyright © 2016 Gwen Cusing. All rights reserved.
//

import Foundation

class CurrentList {
    var entries = [Entry]()
    
    init() {
        let currentDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        let convertedDate = dateFormatter.stringFromDate(currentDate)

        let entry = Entry(name: "John Smith", birthday: "\(convertedDate)", gifts: "gift ideas: a really cool idea", plans: "birthday plans: a really cool plan")
        
        entries.append(entry)
    }
}