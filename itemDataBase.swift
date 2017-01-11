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
    let category = Expression<String?>("category")
    
//    func addItemsTable( ) {
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        let db = try! Connection("\(path)/GroceryBuddy.sqlite")
//        print(path)
//        
//        do {
//            try db.run(items.create (ifNotExists: true) { t in
//                t.column(id, primaryKey: true)
//                t.column(user_id)
//                t.column(itemName, unique: true)
//                t.column(category)
//            })
//        } catch _ {
//            print("cant create Table")
//        }
//        
//        do {
//            try db.run(items.insert(itemName <- name, category <- category))
//            for item in try! db.prepare(items) {
//                print("id: \(item[id]), Item name: \(item[name])")
//                print(path)
//            }
//        } catch _ {
//            print("Could not add item.")
//        }
//    }

}
