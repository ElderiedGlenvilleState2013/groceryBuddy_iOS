//
//  Item.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/19/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import Foundation

class Item {
    
    var user_id: Int
    var name: String
    var category: String
    
    init?( user_id: Int, name: String, category: String) {
        self.user_id = user_id
        self.name = name
        self.category = category
        
        if name.isEmpty && category.isEmpty {
            return nil
        }
    }
}
