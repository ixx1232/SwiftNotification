//
//  ViewController.swift
//  SwiftNotification
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 www.ixxcome123.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2.注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "receive:", name: "cellClick", object: nil)
        
    }
    
    func receive(notification: NSNotification) {
        self.btn.setTitle((notification.userInfo!["cellIndex"])?.description, forState: UIControlState.Normal)
        
        if (((notification.userInfo!["cellIndex"]!.description as NSString).integerValue)%2 == 0){
            self.view.backgroundColor = UIColor.redColor()
        }else {
            self.view.backgroundColor = UIColor.greenColor()
        }
    }
    
    // 3.移除通知
    deinit {
        print("移除通知")
        NSNotificationCenter.defaultCenter() .removeObserver(self)
    }

    @IBAction func btnClick(sender: UIButton) {
        
        let VC = IXXTableVC()
        self.presentViewController(VC, animated: true, completion: nil)
    }
   

}

