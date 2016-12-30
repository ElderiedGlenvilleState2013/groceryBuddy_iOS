//
//  LoginViewController.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/2/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//
import UIKit
import SQLite

class LoginViewController: UIViewController {

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
        let user = userDataBase()
        let results = try! user.userFind()
        
//        print("results: \(results[0].count)")

//        for result in results {
//            print("id: \(result.id), email: \(result.email), password: \(result.password)")
        for i in 0..<results.count {
            if (userEmail == results[i].email) && (userPassword == results[i].password){
                    print("User: \(results[i].email) is logged in")
//                    displayErrorMessage("User: \(results[i].email) is logged in")
                    UserDefaults.standard.set(userEmail, forKey: "userEmail")
                    UserDefaults.standard.set(userPassword, forKey: "userPassword")
                    UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                    UserDefaults.standard.synchronize()
                    let myAlert = UIAlertController(title: "Alert", message: "Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert)
                
                    let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { action in self.dismiss(animated: true, completion: nil)
                    }
                    myAlert.addAction(okAction)
                    self.present(myAlert, animated: true, completion: nil)
                    return
                }
            }
            displayErrorMessage("Enter the correct Email or Password.")
        
//            var emailResult = result.email
//            var passwordResult = result.password
//            print("this is the entered name: \(userEmail) and here are ")
        
//        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
//        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
//            if (userEmail.isEmpty || userPassword.isEmpty ){
//               displayErrorMessage("Fill up the required fields.")
//            } else if(userEmail == emailResult){
//                if(userPassword == passwordResult){
//                    UserDefaults.standard.set(emailResult, forKey: "userEmail")
//                    UserDefaults.standard.set(passwordResult, forKey: "userPassword")
//                    UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
//                    UserDefaults.standard.synchronize()
//                    print("User logged in.")
//                    displayErrorMessage("User logged in.")
////                    self.dismiss(animated: true, completion: nil)
//                    
//                } else {
//                    print("Please enter the right Password.")
//                    displayErrorMessage("Please enter the right Password.")
//                }
//            } else {
//                print("Username not registered.")
//                displayErrorMessage("Username is not registered.")
//            }

//        }
        
       
    }

    
    func displayErrorMessage(_ errorMsge:String) {
        
        let myAlert = UIAlertController(title: "Alert", message: errorMsge, preferredStyle: UIAlertControllerStyle.alert)
    
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
    
        myAlert.addAction(okAction)
    
        self.present(myAlert, animated: true, completion: nil)
    }


}
