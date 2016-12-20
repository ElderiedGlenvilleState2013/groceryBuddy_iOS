//
//  Item.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/19/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import Foundation

class Item {
    
    var name: String
    var category: String
    
    init?(name: String, category: String) {
        self.name = name
        self.category = category
        
        if name.isEmpty && category.isEmpty {
            return nil
        }
    }
}
