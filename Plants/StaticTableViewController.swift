//
//  StaticTableViewController.swift
//  Test819
//
//  Created by 徐正劼 on 15/8/20.
//  Copyright (c) 2015年 徐正劼. All rights reserved.
//

import UIKit

class StaticTableViewController: UITableViewController {
    @IBOutlet weak var switch1: UISwitch!
    var dictData: NSDictionary!
    var selectedName: String!
    var something: String!
    
    @IBOutlet weak var state: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        switch1.setOn(false, animated: false)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if(something == "It sprouted！"){
            self.state.text = "Sprouted"
        } else if(something == "It is time to harvest！"){
            self.state.text = "Harvest"
        } else if(something == "Just a seed！"){
            self.state.text = "Seed!"
        } else {
            self.state.text = "Growing"
        }
        
        self.state.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 2
        
    }
 
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if(segue.identifier == "showCalendar"){
            let rightveiwcontroller = segue.destinationViewController as! RightViewController
            rightveiwcontroller.title = "Calendar"
        }else if(segue.identifier == "showSyn"){
            let syn = segue.destinationViewController as! SynchronizationTableViewController
            syn.title = "Synchronization Settings"
            syn.dictData = self.dictData
            syn.selectedName = self.selectedName
            syn.something = self.state.text!
        }
    }


}
