//
//  ViewController.swift
//  Facetheperformance
//
//  Created by Dominik Kratky on 07.12.17.
//  Copyright © 2017 Dominik Kratky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var statusLabel = UILabel()
    var labelStr = "Hello World!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateStatusLabel), name: NSNotification.Name(rawValue: "updateExitStatus"), object: nil)
        
        updateStatusLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateStatusLabel(){
        let exitStatus = UserDefaults.standard
        if let str = exitStatus.string(forKey: "exitStatus"){
            labelStr = str
        }
        statusLabel.text = labelStr
        statusLabel.sizeToFit()
        statusLabel.center = self.view.center
        self.view.addSubview(statusLabel)
    }
   
        
}


