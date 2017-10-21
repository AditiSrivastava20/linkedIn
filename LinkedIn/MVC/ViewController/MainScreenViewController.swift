//
//  MainScreenViewController.swift
//  LinkedIn
//
//  Created by Sierra 4 on 28/03/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit
import LinkedinSwift

class MainScreenViewController: UIViewController {

    @IBOutlet weak var btnoutlet: UIButton!
    let linkedinHelper = LinkedinSwiftHelper(configuration: LinkedinSwiftConfiguration(clientId: "8107lg6kg8py6n",
                                                                                       clientSecret: "XfuvFIq5FnK3B9k7",
                                                                                       state: "987654321",
                                                                                       permissions: ["r_basicprofile", "r_emailaddress"],
                                                                                       redirectUrl: "https://www.example.com/auth/linkapp"))
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        linkedinHelper.authorizeSuccess({ [unowned self] (lsToken) -> Void in
            self.writeConsoleLine("Login success lsToken: \(lsToken)")
            }, error: { [unowned self] (error) -> Void in
                
                self.writeConsoleLine("Encounter error: \(error.localizedDescription)")
            }, cancel: { [unowned self] () -> Void in
                
                self.writeConsoleLine("User Cancelled!")
        })
    }
    fileprivate func writeConsoleLine(_ log: String, funcName: String = #function) {
    }
    
    
    
    @IBAction func btnProfileDisplay(_ sender: UIButton) {
        linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~:(id,first-name,last-name,email-address,picture-url,picture-urls::(original),positions,date-of-birth,phone-numbers,location)?format=json", requestType: LinkedinSwiftRequestGet, success: { (response) -> Void in
            print("SUCCESSS")
            print(response)
            self.writeConsoleLine("Request success with response: \(response)")
            
        }) { [unowned self] (error) -> Void in
            
            self.writeConsoleLine("Encounter error: \(error.localizedDescription)")
            print("FAIL")
        }
    }
    
    
}
