//
//  ViewController.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/1/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController, sendDataDelegate1 {
    
    @IBOutlet weak var helloUserLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginView" {
            let loginVC: LoginViewController = segue.destination as! LoginViewController
            loginVC.delegate1 = self
        }
    }
    
    func sendUserEmail(data: String){
        helloUserLbl.text = data
        UserDefaults.standard.set(data, forKey: "userEmail")
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

