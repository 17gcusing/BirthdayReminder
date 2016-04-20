//
//  DetailsController.swift
//  Birthday Reminder
//
//  Created by Gwen Cusing on 4/11/16.
//  Copyright © 2016 Gwen Cusing. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    var entry: Entry?

    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBAction func textFieldEditing(sender: AnyObject) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: selector(DetailsController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
}