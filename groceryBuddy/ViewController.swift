//
//  ViewController.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/1/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    @IBOutlet weak var helloUserLbl: UILabel!
    
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        helloUserLbl.text = ""
        helloUserLbl.text = UserDefaults.standard.string(forKey: "userEmail")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if (!isUserLoggedIn){
            self.performSegue(withIdentifier: "loginView", sender: self)
        }
    }

    @IBAction func userLogout(_ sender: AnyObject) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.set("", forKey: "userEmail")
        UserDefaults.standard.set("", forKey: "userPassword")
        UserDefaults.standard.synchronize()
        self.performSegue(withIdentifier: "loginView", sender: self)
//        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

