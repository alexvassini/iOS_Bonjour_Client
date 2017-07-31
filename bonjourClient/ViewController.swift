//
//  ViewController.swift
//  bonjourClient
//
//  Created by Alexandre  Vassinievski on 28/07/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAdvertisingToServer()
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        
        BonjourTCPClient.sharedInstance.send(self.textField.text!)
        print("OI")
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


}

