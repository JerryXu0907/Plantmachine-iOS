//
//  TipsViewController.swift
//  Plants
//
//  Created by 徐正劼 on 15/8/22.
//  Copyright (c) 2015年 徐正劼. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    var url: String! = "http://www.52caiyuan.com/article-2-1.html"
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: self.url)
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
        self.webView.delegate = self
        self.webView.scalesPageToFit = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigationf

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
