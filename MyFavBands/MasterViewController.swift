//
//  MasterViewController.swift
//  MyFavBands
//
//  Created by cis290 on 9/26/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//


// You went too fast for me to follow, so I ended up missing several parts to copy paste. Instead of having it not work I copied and pasted the whole thing.


import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    
    // Ignore Errors on this page. They will go away when you make changes to DetailViewController
    //1) Comment out
    // var objects = [AnyObject]()
    
    //2) Create new MSMutableArray
    var listArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //3) Comment out edit button
        // self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        //4) Populate Array of band names from images you downloaded. Names must match file names without file extenstion .jpg
        
        listArray = ["TheLonelyIsland","BoBurnham","Eminem","FalloutBoy", "ImagineDragons","Journey", "LilDicky","Maroon5"]
        
        //5) Comment out Add Button - 2 lines
        
        
        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
        
        //6) Add Title
        title = "My Favorite Bands"
        
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //7) Comment out Insert Function
    //    func insertNewObject(sender: AnyObject) {
    //        objects.insert(NSDate(), atIndex: 0)
    //        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    //        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    //    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //8) Replace objects with listArray and NSDate with NSString
                let object = listArray[indexPath.row] as! NSString
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                
                //9) Add 2 lines of code to populate Name and URL. Ignore Error lines
                controller.productName = object as String
                controller.productURL = (object as String) + ".jpg"
                
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                //10) Add to hide Menu after tap
                self.splitViewController?.toggleMasterView()
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //11 Comment Out
        
        // return objects.count
        
        //12) Add Code
        return listArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //13) Replace objects with listArray and NSDate with NSString
        let object = listArray[indexPath.row] as! NSString
        cell.textLabel!.text = object.description
        return cell
    }
    
    //14) Comment out override func tableView
    
    //    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    //        // Return false if you do not want the specified item to be editable.
    //        return true
    //    }
    
    
    //15) Comment out override func tableView(tableView
    
    //    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    //        if editingStyle == .Delete {
    //            objects.removeAtIndex(indexPath.row)
    //            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //        } else if editingStyle == .Insert {
    //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    //        }
    //    }
    
    
    
}

//15) Add extenson to hide menu after last right bracket
extension UISplitViewController {
    func toggleMasterView() {
        let barButtonItem = self.displayModeButtonItem()
        UIApplication.sharedApplication().sendAction(barButtonItem.action, to: barButtonItem.target, from: nil, forEvent: nil)
    }
}