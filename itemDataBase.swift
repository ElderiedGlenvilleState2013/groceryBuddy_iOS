//
//  itemDataBase.swift
//  groceryBuddy
//
//  Created by RubyThree on 1/11/17.
//  Copyright © 2017 RubyThree. All rights reserved.
//

import Foundation
import SQLite

class itemDataBase {
    
    let items = Table("items")
    let id = Expression<Int64>("id")
    let user_id = Expression<Int64>("user_id")
    let itemName = Expression<String>("itemName")
    let itemCategory = Expression<String>("itemCategory")
    
    func addItemsTable(uid: Int, name: String, category: String) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let db = try! Connection("\(path)/GroceryBuddy.sqlite")
        print(path)
        
        do {
            try db.run(items.create (ifNotExists: true) { t in
                t.column(id, primaryKey: true)
                t.column(user_id)
                t.column(itemName, unique: true)
                t.column(itemCategory)
            })
        } catch _ {
            print("cant create Table")
        }
        
        do {
            try db.run(items.insert(user_id <- Int64(uid), itemName <- name, itemCategory <- category))
            for item in try! db.prepare(items) {
                print("id: \(item[id]), Item name: \(item[itemName]), Item category: \(item[itemCategory])")
                print(path)
            }
        } catch _ {
            print("Could not add item.")
        }
    }
    
    func getItems() -> [Item]{
        
        var selectedItem = [Item]()

        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let db = try! Connection("\(path)/GroceryBuddy.sqlite")
        
        do {
            for item in try! db.prepare(items.select(id, user_id, itemName, itemCategory)) {
                selectedItem.append(Item(user_id: Int(item[user_id]), itemName: item[itemName], itemCategory: item[itemCategory])!)
            }
        } catch _ {
            print("Cannot print items!")
        }
        return selectedItem
    }

}

