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
    var actualList: [Entry]!
    var entries = [Entry(name: "", birthday: "", gifts: "", plans: "")]
    var entry = Entry(name: "", birthday: "", gifts: "", plans: "")
    var detailsIndex: Int?
    
    func loadActualList() {
        actualList = []
        actualList.insert(Entry(name: "\(list.entries[0].name)", birthday: "\(list.entries[0].birthday)", gifts: "\(list.entries[0].giftIdeas)", plans: "\(list.entries[0].birthdayPlans)"), atIndex: 0)
        actualList.appendContentsOf(entries)
        actualList.removeAtIndex(1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadActualList()
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
        return actualList!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell?
        if (cell != nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
    
        cell!.textLabel?.text = actualList![indexPath.row].name
        cell!.detailTextLabel?.text = actualList![indexPath.row].birthday
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showDetailsSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newEntrySegue" {
            if let destinationViewController = segue.destinationViewController as? DetailsController {
                destinationViewController.status = true
                destinationViewController.completeList = entries
            }
        } else {
            if let destinationViewController = segue.destinationViewController as? DetailsController {
                detailsIndex = tableView.indexPathForSelectedRow?.row
                destinationViewController.name = actualList![detailsIndex!].name
                destinationViewController.birthday = actualList![detailsIndex!].birthday
                destinationViewController.gifts = actualList![detailsIndex!].giftIdeas
                destinationViewController.plans = actualList![detailsIndex!].birthdayPlans
                destinationViewController.firstIndex = detailsIndex!
                destinationViewController.status = false
                destinationViewController.completeList = entries
            }
        }
    }
}


