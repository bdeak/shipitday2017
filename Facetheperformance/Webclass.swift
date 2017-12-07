//
//  WebClass.swift
//  Facetheperformance
//
//  Created by Dominik Kratky on 07.12.17.
//  Copyright © 2017 Dominik Kratky. All rights reserved.
//

import Foundation
class WebClass {
    func lockAction(){
        let url = URL(string: "https://gr2lqfx86d.execute-api.eu-central-1.amazonaws.com/prod/lock")!
        var request = URLRequest(url: url)
        //request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let imei = "145826789012347455912"
        let phone_token = "VGhlIHBhcnRpY3VsYXIgY2hvaWNlIG9mIGNoYXJh"
        let json = ["imei": imei, "phone_token" : phone_token]
        do {
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("Lock:responseString = \(String(describing: responseString))")
        }
        task.resume()
        } catch {
            print ("Error")
        }
    }

    
    func unlockAction(){
        let url = URL(string: "https://gr2lqfx86d.execute-api.eu-central-1.amazonaws.com/prod/unlock")!
        var request = URLRequest(url: url)
        //request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let imei = "145826789012347455912"
        let phone_token = "VGhlIHBhcnRpY3VsYXIgY2hvaWNlIG9mIGNoYXJh"
        let json = ["imei": imei, "phone_token" : phone_token]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(String(describing: response))")
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print("Unlock:responseString = \(String(describing: responseString))")
            }
            task.resume()
        } catch {
            print ("Error")
        }
    }

}
    



