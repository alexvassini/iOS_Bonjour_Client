//
//  ViewController.swift
//  bonjourClient
//
//  Created by Alexandre  Vassinievski on 28/07/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

   
    
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAdvertisingToServer()
        
        textField.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startAdvertisingToServer() {
        
       
            
            BonjourTCPClient.sharedInstance.servicesCallback = { (services) in
                guard let service = services.first else {
                    return NSLog("No services...")
                }
                BonjourTCPClient.sharedInstance.connectTo(service, callback: {
                    NSLog("Connected")
                })
            }
            
            
        
    }

    func textViewDidChange(_ textView: UITextView) {
        
        BonjourTCPClient.sharedInstance.send(self.textField.text!)
        print("OI")

    }

}

