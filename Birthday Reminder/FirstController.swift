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
    
    var list: CurrentList!
    var entry: Entry?
    var name = ""
    var path: NSIndexPath?
    var detailsIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        list = CurrentList()
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
    
        cell.textLabel?.text = list.entries[indexPath.row].name
        cell.detailTextLabel?.text = list.entries[indexPath.row].birthday
        
        name = list.entries[indexPath.row].name
        path = indexPath
        
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        if let destinationViewController = navigationController?.storyboard?.instantiateViewControllerWithIdentifier("showDetailsSegue") as? DetailsController {
//            navigationController?.pushViewController(destinationViewController, animated: true)
//        }
        
        let detailsController = navigationController!.storyboard?.instantiateViewControllerWithIdentifier("showDetailsSegue")
        navigationController?.pushViewController(detailsController!, animated: true)
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
        if let destinationViewController = segue.destinationViewController as? DetailsController {
            destinationViewController.list = list
        }
    }
}


