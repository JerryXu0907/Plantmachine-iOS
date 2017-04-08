//
//  ViewController.swift
//  Test819
//
//  Created by 徐正劼 on 15/8/18.
//  Copyright (c) 2015年 徐正劼. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var dictData: NSMutableDictionary! = ["Green1":"31", "Green2":"23"]
    var listData: NSArray!
    var mutableListData : NSMutableArray!
    
    
    @IBOutlet var txtField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.listData = self.dictData.allKeys as NSArray
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* txtField的生命周期方法 */
    override func setEditing(editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: true)
        self.tableView.setEditing(editing, animated: true)
        if editing{
            self.txtField.hidden = false
        } else{
            self.txtField.hidden = true
        }
    }
    
    /* 单元格的行数 */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    
    /* 单元格的插入删除 */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cellIdentifier = "CellIdentifier"
        let cellIdentifier2 = "otherIdentifier"
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = self.listData[row] as! NSString as String
        var selectName = self.listData[row] as! NSString as String
        return cell
    }
    
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if (indexPath.row == self.listData.count){
            return UITableViewCellEditingStyle.Insert
        } else {
            return UITableViewCellEditingStyle.Delete
        }
    }
    
   
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showDetail"){
            let plantViewController = segue.destinationViewController as! PlantViewController
            let indexPath = self.tableView.indexPathForSelectedRow() as NSIndexPath?
            let selectedIndex = indexPath!.row
            let dict = self.listData[selectedIndex] as! NSString
            plantViewController.title = dict as String
            plantViewController.dictData = self.dictData
            plantViewController.selectedName = self.listData[selectedIndex] as! String
            
            
            
        }else if(segue.identifier == "showNew"){
            let tableviewcontroller = segue.destinationViewController as! TableViewController
            tableviewcontroller.data = self.dictData
        }
    }
    
    
}