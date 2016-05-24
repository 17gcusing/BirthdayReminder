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
    var name = ""
    var newName = ""
    var birthday = ""
    var gifts = "gift ideas: "
    var plans = "birthday plans: "
    var index: Int?
    var status: Bool?


    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var giftPlansTextField: UITextView!
    @IBOutlet weak var plansTextField: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func textFieldEditing(sender: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("dateFormat:"), forControlEvents: UIControlEvents.ValueChanged)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = name
        birthdayTextField.text = birthday
        giftPlansTextField.text = gifts
        plansTextField.text = plans
        if status == true {
            saveButton.hidden = false
        } else {
            saveButton.hidden = true
        }
    }
    
    func dateFormat(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        let currentDate = NSDate()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        birthday = dateFormatter.stringFromDate(currentDate)
        birthdayTextField.text = dateFormatter.stringFromDate(sender.date)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveNew" {
            let firstController = segue.destinationViewController as? FirstController
            entry = Entry(name: nameTextField.text!, birthday: birthdayTextField.text!, gifts: giftPlansTextField.text!, plans: plansTextField.text!)
            firstController!.list.entries.append(entry!)
        } else if segue.identifier == "saveDetailsSegue" {
            if ((nameTextField.text?.isEmpty) == true) {
                segue.destinationViewController as? FirstController
            } else {
                let firstController = segue.destinationViewController as? FirstController
                firstController!.list.entries[index!].name = nameTextField.text!
                firstController!.list.entries[index!].birthday = birthdayTextField.text!
                firstController!.list.entries[index!].giftIdeas = giftPlansTextField.text!
                firstController!.list.entries[index!].birthdayPlans = plansTextField.text!
            }
        }
    }
}