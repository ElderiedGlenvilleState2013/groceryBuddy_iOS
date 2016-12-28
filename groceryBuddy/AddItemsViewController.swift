//
//  AddItemsViewController.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/19/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import UIKit

class AddItemsViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var addItem: UITextField!
    @IBOutlet weak var addCategory: UITextField!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    @IBOutlet weak var saveBtn: UIButton!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addItem.delegate = self
//        checkValidItemName()

    
    }

    @IBAction func addBtnPressed(_ sender: Any) {
        addItems()
    }

    @IBAction func saveBtnPressed(_ sender: Any) {
        addItems()
    }
    
    func addItems(){
        if addItem.text != "" && addCategory.text != "" {
            let newItem = Item(name: addItem.text!, category: addCategory.text!)
            items.append(newItem!)
            print("Save Button pressed!\(addItem.text!)")
            addItem.text = ""
            addCategory.text = ""
            navigationController?.popViewController(animated: true)
            
            let myAlert = UIAlertController(title: "Alert", message: "Item Added", preferredStyle: UIAlertControllerStyle.alert)
            print("Item Added")
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {
                action in self.dismiss(animated: true, completion: nil)
            }
            myAlert.addAction(okAction)
            self.present(myAlert, animated: true, completion: nil)
            
        } else {
            displayAlertonItems("All fields are required.")
            print("Fields must be filled.")
            
            return
        }
        
    }
    
//    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if saveBtn === sender || addBtn === sender {
//            let name = addItem.text ?? ""
//            let category = addCategory.text ?? ""
//            
//            item = Item(name: name, category: category)
//            print(item)
//        var secondVC : ItemsTableVC = segue.destination as! ItemsTableVC
//        
//        secondVC.items = addItem.text
//    }
//    
    func displayAlertonItems(_ userMessage:String ){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addItem.resignFirstResponder()
        return true
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        saveBtn.isEnabled = false
//    }


}
