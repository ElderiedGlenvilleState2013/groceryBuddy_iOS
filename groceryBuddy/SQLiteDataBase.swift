//
//  SQLiteDataBase.swift
//  groceryBuddy


import Foundation
import UIKit
import SQLite

class SQLiteDataBase {

    static let instance = SQLiteDataBase()
    private let db: Connection?
    
    private init() {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/GroceryBuddy.sqlite")
        } catch {
            db = nil
            print("Cannot create DataBase!")
        }
    }

    
//    func databaseConnect() throws {
//        
//        do {
//            let db = try Connection("\(path)/GroceryBuddy.sqlite")
//            print(path)
//            let users = Table("users")
//            let id = Expression<Int64>("id")
//            let email = Expression<String>("email")
//            let password = Expression<String?>("password")
////        try! db.run(users.delete())
//            do {
//                try db.run(users.create (ifNotExists: true) { t in
//                    t.column(id, primaryKey: true)
//                    t.column(email, unique: true, check: email.like("%@%"))
//                    t.column(password)
//                })
//            } catch _ {
//              print("cant create Table")
//            }
//        
//            do {
//                try db.run(users.insert(email <- userEmail, password <- userPassword))
//                for user in try! db.prepare(users) {
//                    print("id: \(user[id]), email: \(user[email])")
//                    print(path)
//                }
//            } catch _ {
//                print("Could not add user.")
//            }
//        } catch _ {
//            print("cannot create DataBase!")
//        }
//    }
    
//    func addUsersTable(userEmail: String, userPassword: String) {
//
//        let db = try! Connection("\(path)/GroceryBuddy.sqlite")
//            print(path)
//        
//        let users = Table("users")
//        let id = Expression<Int64>("id")
//        let email = Expression<String>("email")
//        let password = Expression<String?>("password")
//        do {
//            try db.run(users.create (ifNotExists: true) { t in
//                t.column(id, primaryKey: true)
//                t.column(email, unique: true, check: email.like("%@%"))
//                t.column(password)
//            })
//        } catch _ {
//            print("cant create Table")
//        }
//        
//        do {
//            try db.run(users.insert(email <- userEmail, password <- userPassword))
//            for user in try! db.prepare(users) {
//                print("id: \(user[id]), email: \(user[email])")
//                print(path)
//            }
//        } catch _ {
//            print("Could not add user.")
//        }
    }
   


