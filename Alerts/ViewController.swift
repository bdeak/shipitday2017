//
//  ViewController.swift
//  Alerts
//
//  Created by Jana Bales on 08.12.17.
//  Copyright © 2017 Tuts. All rights reserved.
//

import UIKit
import LocalAuthentication

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
        
        let alertView = UIAlertView(title: "Alert", message: "Do you wish to lock or unlock your car?", delegate: self, cancelButtonTitle: "unlock", otherButtonTitles: "lock")
        
        // Configure Alert View
        alertView.tag = 1
        
        // Show Alert View
        alertView.show()
    }
    
    public func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        let web = WebClass()
        print(buttonIndex)
        let myContext = LAContext()
        let myLocalizedReasonString = "Authorization required for lock/unlock process."
        
        var authError: NSError?
        if alertView.tag == 1 {
            if buttonIndex == 0 {
                
                if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                    myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                        if success {
                                web.unlockAction()
                            } else {
                                self.presentAlertController(withTitle: "Error", message: "Authentication failed")
                                // User did not authenticate successfully, look at error and take appropriate action
                            }
                        }
                    } else {
                        // Could not evaluate policy; look at authError and present an appropriate message to user
                        self.presentAlertController(withTitle: "Error", message: "Authentication failed or no Face and Touch ID available")
                    }
                
            } else {
                if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                    myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                        
                        if success {
                            web.lockAction()
                        } else {
                            self.presentAlertController(withTitle: "Error", message: "Authentication failed")
                            // User did not authenticate successfully, look at error and take appropriate action
                        }
                    }
                } else {
                    // Could not evaluate policy; look at authError and present an appropriate message to user
                    self.presentAlertController(withTitle: "Error", message: "Authentication failed or no Face and Touch ID available")
                }
            }
        }
    }
    
        
    func presentAlertController(withTitle title: String?, message: String?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok",
                                                style: .default,
                                                handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

