//
//  RegisterViewController.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/1/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import UIKit


class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerTapButton(_ sender: AnyObject) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let repeatPassword = repeatPasswordTextField.text
        
        if(userEmail!.isEmpty || userPassword!.isEmpty || repeatPassword!.isEmpty) {
            
            displayMyAlertMessage("All fields are required.")
            
            return
        }
        if(userPassword != repeatPassword){
            displayMyAlertMessage("Passwords do not match.")
            
            return
        }
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert)
            print("this should display too...")

        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {
            action in self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func displayMyAlertMessage(_ userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
     
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
