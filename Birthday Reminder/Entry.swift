//
//  Entry.swift
//  Birthday Reminder
//
//  Created by Gwen Cusing on 4/12/16.
//  Copyright © 2016 Gwen Cusing. All rights reserved.
//

import Foundation

class Entry {
    let name: String
    let birthday: String
    
    convenience init() {
        self.init(name: "Default name", birthday: "Default date")
    }
    
    init(name: String, birthday: String){
        self.name = name
        self.birthday = birthday
    }
}