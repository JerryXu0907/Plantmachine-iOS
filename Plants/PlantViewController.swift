//
//  PlantViewController.swift
//  Test819
//
//  Created by 徐正劼 on 15/8/18.
//  Copyright (c) 2015年 徐正劼. All rights reserved.
//

import UIKit

class PlantViewController: UIViewController {
    
    var dictData: NSDictionary!
    var selectedName: String!
   
    @IBOutlet weak var Suggestions: UILabel!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var weatherText: UITextView!
    @IBAction func refresh(sender: UIButton) {
        
        loadweather()
        
    }
    
    func loadweather(){
            var url = NSURL(string:"http://www.weather.com.cn/data/sk/101020100.html")
            var data = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingUncached, error: nil)
            var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
            var weatherinfo: AnyObject! = json.objectForKey("weatherinfo")
            var city: AnyObject! = weatherinfo.objectForKey("city")
            var temp: AnyObject! = weatherinfo.objectForKey("temp")
            var humidity: AnyObject! = weatherinfo.objectForKey("SD")
            weatherText.text = "City:Shanghai \n Temperature:\(25) \n Humidity:\(humidity)"
            showSuggestions(humidity)
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadweather()

        // Do any additional setup after loading the view.
        
        
        
        Label.text = "You Have Planted for \(dictData[selectedName]!) days"
        
        if (dictData[selectedName] as! String == "23") {
            Label2.text = "It sprouted！"
        } else if(dictData[selectedName] as! String == "31"){
            Label2.text = "It is time to harvest！"
        } else if(dictData[selectedName] as! String == "0"){
            Label2.text = "Just a seed！"
        } else{
            Label2.text = "Still Growing！"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func showSuggestions(sender: AnyObject){
        var standardSuggestions: String = "Everyday is a good planting day!😀"
        var suggest: String = ""
        var wholesuggest:String = ""
        
        if (sender as! String == "96%"){
            suggest = "It is very wet today. Do not water your plants"
            wholesuggest = "\(suggest) \n \(standardSuggestions)"
        }else {
            suggest = "Watering your plant is important, but not in a large quantity"
            wholesuggest = "\(suggest) \n \(standardSuggestions)"
        }
        
        Suggestions.text = wholesuggest
        
        
    }
    
  

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showCalendar"){
            let rightViewController = segue.destinationViewController as! RightViewController
            rightViewController.title = "Calendar"
        }else if (segue.identifier == "showStatic"){
            let staticviewcontroller = segue.destinationViewController as! StaticTableViewController
            staticviewcontroller.title = "Settings"
            staticviewcontroller.dictData = self.dictData
            staticviewcontroller.selectedName = self.selectedName
            staticviewcontroller.something = self.Label2.text!
        }else if (segue.identifier == "showTips"){
            let tip = segue.destinationViewController as! TipsViewController
            tip.title = "Tips for planting"
        }
    }


}

