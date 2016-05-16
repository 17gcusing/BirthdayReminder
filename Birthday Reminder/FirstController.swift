//
//  ViewController.swift
//  Birthday Reminder
//
//  Created by Gwen Cusing on 4/11/16.
//  Copyright © 2016 Gwen Cusing. All rights reserved.
//

import UIKit

class FirstController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var list = CurrentList()
    var entry: Entry?
    var name = ""
    var detailsIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        print ("viewWillAppear")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.entries.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?
        if (cell != nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        
        cell!.textLabel?.text = list.entries[indexPath.row].name
        cell!.detailTextLabel?.text = list.entries[indexPath.row].birthday
        
        return cell!

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showDetailsSegue", sender: self)
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetailsSegue" {
//            if let detailsController = segue.destinationViewController as? DetailsController {
//                detailsIndex = tableView.indexPathForSelectedRow?.row
//                detailsController.nameTextField.text = list.entries[detailsIndex!].name
//            }
//        }
//        else if segue.identifier == "newEntrySegue" {
//            if let detailsController = segue.destinationViewController as? DetailsController {
//                detailsController.name = "name"
//            }
//        }
//    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newEntrySegue" {
            if let destinationViewController = segue.destinationViewController as? DetailsController {
                destinationViewController.list = list
                
            }
        } else {
            if let destinationViewController = segue.destinationViewController as? DetailsController {
                detailsIndex = tableView.indexPathForSelectedRow?.row
//                destinationViewController.nameTextField.text = list.entries[detailsIndex!].name
//                destinationViewController.birthdayTextField.text = list.entries[detailsIndex!].birthday
//                destinationViewController.giftPlansTextField.text = list.entries[detailsIndex!].giftIdeas
//                destinationViewController.plansTextField.text = list.entries[detailsIndex!].birthdayPlans
            }
        }
    }
}


