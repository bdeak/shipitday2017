//
//  ViewController.swift
//  Alerts
//
//  Created by Jana Bales on 08.12.17.
//  Copyright © 2017 Tuts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: AnyObject) {
        // Initialize Alert View
        
        let alertView = UIAlertView(title: "Alert", message: "Do you wish to unlock your car?", delegate: self, cancelButtonTitle: "Yes", otherButtonTitles: "No")
        
        // Configure Alert View
        alertView.tag = 1
        
        // Show Alert View
        alertView.show()
    }
    
    public func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        let web = WebClass()
        print(buttonIndex)
        if alertView.tag == 1 {
            if buttonIndex == 0 {
                web.unlockAction()
            } else {
                web.lockAction()
            }
        }
    }
    
}

