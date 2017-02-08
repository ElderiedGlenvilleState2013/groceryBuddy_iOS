//
//  RegisterViewController.swift
//  groceryBuddy


import UIKit
import SQLite

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
        
//        UserDefaults.standard.set(userEmail, forKey: "userEmail")
//        UserDefaults.standard.set(userPassword, forKey: "userPassword")
//        UserDefaults.standard.synchronize()
        let user = userDataBase()
        user.addUsersTable(userEmail: userEmail!, userPassword: userPassword!)
        
        
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
    

}
