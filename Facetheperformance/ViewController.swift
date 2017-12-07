//
//  ViewController.swift
//  Facetheperformance
//
//  Created by Dominik Kratky on 07.12.17.
//  Copyright © 2017 Dominik Kratky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func applicationDidEnterBackground(_ application: UIViewController){
       
    }
    
    func backgroundRefreshStatus(_ application: UIViewController)
    {
        let test = Webclass()
        test.registerforDeviceLockNotification()
    }
    
   
        
}


