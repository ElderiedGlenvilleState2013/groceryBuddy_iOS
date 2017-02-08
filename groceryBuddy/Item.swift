//
//  Item.swift
//  groceryBuddy
//


import Foundation
import UIKit

class Item {
    
    var user_id: Int
    var itemName: String
    var itemCategory: String
    
    init?( user_id: Int, itemName: String, itemCategory: String) {
        self.user_id = user_id
        self.itemName = itemName
        self.itemCategory = itemCategory
        
        if itemName.isEmpty && itemCategory.isEmpty {
            return nil
        }
    }
}
