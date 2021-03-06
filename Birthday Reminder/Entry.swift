//
//  Entry.swift
//  Birthday Reminder
//
//  Created by Gwen Cusing on 4/12/16.
//  Copyright © 2016 Gwen Cusing. All rights reserved.
//

import Foundation

class Entry {
    var name: String
    var birthday: String
    var giftIdeas: String
    var birthdayPlans: String
    
    convenience init() {
        self.init(name: "Default name", birthday: "Default date", gifts: "Default gift", plans: "Default Gift")
    }
    
    init(name: String, birthday: String, gifts: String, plans: String){
        self.name = name
        self.birthday = birthday
        self.giftIdeas = gifts
        self.birthdayPlans = plans
    }
}