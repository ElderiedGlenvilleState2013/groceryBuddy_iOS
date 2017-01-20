//
//  userDataBase.swift
//  groceryBuddy
//
//  Created by RubyThree on 1/10/17.
//  Copyright © 2017 RubyThree. All rights reserved.
//

import Foundation
import SQLite


class userDataBase {

    let users = Table("users")
    let id = Expression<Int64>("id")
    let email = Expression<String>("email")
    let password = Expression<String?>("password")


    func addUsersTable(userEmail: String, userPassword: String) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let db = try! Connection("\(path)/GroceryBuddy.sqlite")
        print(path)
    
        do {
            try db.run(users.create (ifNotExists: true) { t in
                t.column(id, primaryKey: true)
                t.column(email, unique: true, check: email.like("%@%"))
                t.column(password)
            })
        } catch _ {
            print("cant create Table")
        }
    
        do {
            try db.run(users.insert(email <- userEmail, password <- userPassword))
            for user in try! db.prepare(users) {
                print("id: \(user[id]), email: \(user[email])")
                print(path)
            }
        } catch _ {
            print("Could not add user.")
        }
    }

    func userFind(userEmail: String, userPassword: String) -> [User]{
        
        var selectedUser = [User]()
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let db = try! Connection("\(path)/GroceryBuddy.sqlite")
        print(path)
        
        do {
        
//            for user in try! db.prepare(users.filter(email == userEmail)) {
//                selectedUser.append(User(id: user[id], email: user[email], password: user[password]!))
//                print("id: \(user[id]), email: \(user[email]) with password: \(user[password]!)")
            
            if let theUser = try! db.pluck(users.filter(email == userEmail)) {
                if (theUser[id] == 0){
                    print("User doesnt not exist")
                    selectedUser.append(User(id: 0))
                } else {
                selectedUser.append(User(id: theUser[id], email: theUser[email], password: theUser[password]!))
                print("id: \(theUser[id]), email: \(theUser[email]) with password: \(theUser[password]!)")
                }
            }
        } catch _ {
            print("Cannot print users.")
        }
        return selectedUser
        
    }


//    func userFind() -> [User] {
//    
//        var selectedUser = [User]()
//    
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        let db = try! Connection("\(path)/GroceryBuddy.sqlite")
//        print(path)
//    
//        do {
//        
//                for user in try! db.prepare(users.select(id, email, password)) {
//                    selectedUser.append(User(id: user[id], email: user[email], password: user[password]!))
//            }
//        } catch _ {
//            print("Cannot print users.")
//        }
//        return selectedUser
//    }

}
