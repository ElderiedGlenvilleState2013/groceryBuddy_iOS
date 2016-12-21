//
//  AddItemsViewController.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/19/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import UIKit

var item_list = [String]()

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

        // Do any additional setup after loading the view.
    }

    @IBAction func saveBtnPressed(_ sender: AnyObject){
        if addItem.text != "" && addCategory.text != "" {
            let newItem = Item(name: addItem.text!, category: addCategory.text!)
            items.append(newItem!)
//            items.append(addItem.text!)
            UserDefaults.standard.set(item_list, forKey: "list")
            print("Save Button pressed!\(addItem.text!)")
            addItem.text = ""
            addCategory.text = ""
        } else {
            print("Fields must be filled.")
        }
        
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if saveBtn === sender || addBtn === sender {
//            let name = addItem.text ?? ""
//            let category = addCategory.text ?? ""
//            
//            item = Item(name: name, category: category)
//            print(item)
        var secondVC : ItemsTableVC = segue.destination as! ItemsTableVC
        
//        secondVC.items = addItem.text
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
//
//    func checkValidItemName() {
//        // Disable the Save button if the text field is empty.
//        let text = addItem.text ?? ""
//        saveBtn.isEnabled = !text.isEmpty
//    }


}
