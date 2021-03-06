//
//  LoginViewController.swift
//  groceryBuddy

import UIKit
import SQLite

class LoginViewController: UIViewController {
    
    var delegate1: sendDataDelegate1?

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: AnyObject) {
        
        guard let userEmail = userEmailTextField.text, let userPassword = userPasswordTextField.text else {
            print("Unwrapping email or password failed..")
            return 
            
        }
        if(userEmail.isEmpty || userPassword.isEmpty) {
            
            displayErrorMessage("Please fill up the required fields. Thank You.")
            
            return
        }
        
        let user = userDataBase()
        let results = try! user.userFind(userEmail: userEmail, userPassword: userPassword)
   
        if (userEmail == results[0].email) && (userPassword == results[0].password){
                UserDefaults.standard.set(userEmail, forKey: "userEmail")
                UserDefaults.standard.set(userPassword, forKey: "userPassword")
                let data1 = results[0].email
                UserDefaults.standard.set(results[0].id, forKey: "userId")
                delegate1?.sendUserEmail(data: data1)
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                let myAlert = UIAlertController(title: "Alert", message: "You are now logged in \(userEmail)", preferredStyle: UIAlertControllerStyle.alert)
                
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { action in self.dismiss(animated: true, completion: nil)
                }
                myAlert.addAction(okAction)
                self.present(myAlert, animated: true, completion: nil)
                return
            }

            displayErrorMessage("Enter the correct Email or Password.")
    }

    
    func displayErrorMessage(_ errorMsge:String) {
        
        let myAlert = UIAlertController(title: "Alert", message: errorMsge, preferredStyle: UIAlertControllerStyle.alert)
    
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
    
        myAlert.addAction(okAction)
    
        self.present(myAlert, animated: true, completion: nil)
    }

}

protocol sendDataDelegate1 {
    
    func sendUserEmail(data: String)
    
}


