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
    var list: CurrentList!
    var name = ""
    var newName = ""
    var todayDate = ""


    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var giftPlansTextField: UITextView!
    @IBOutlet weak var plansTextField: UITextView!
    
    @IBAction func textFieldEditing(sender: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("dateFormat:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = name
        birthdayTextField.text = todayDate
    }
    
    func dateFormat(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        let currentDate = NSDate()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        todayDate = dateFormatter.stringFromDate(currentDate)
        birthdayTextField.text = dateFormatter.stringFromDate(sender.date)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let firstController = segue.destinationViewController as? FirstController
        list.entries.append(Entry(name: nameTextField.text!, birthday: birthdayTextField.text!, gifts: giftPlansTextField.text, plans: plansTextField.text))
    }
}