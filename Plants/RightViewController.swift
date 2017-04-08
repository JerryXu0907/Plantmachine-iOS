//
//  RightViewController.swift
//  Test819
//
//  Created by 徐正劼 on 15/8/19.
//  Copyright (c) 2015年 徐正劼. All rights reserved.
//

import UIKit
import Foundation

class RightViewController: UIViewController {
    var rightviewcontroller: RightViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCalendar()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCalendar() {
        
        let urlPath: String = "calshow://"
        var url: NSURL = NSURL(string: urlPath)!
        UIApplication.sharedApplication().openURL(url)
    }
    

}


// MARK : TableViewDataSource & Delegate Methods
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */







