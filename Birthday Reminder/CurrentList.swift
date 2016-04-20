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
        let birthdayData = ["John Smith": "January 1, 2016"]
        
        entries = birthdayData.map(
            { (name: String, birthday: String) -> Entry in return Entry(name: name, birthday: birthday)})
        
    }
}