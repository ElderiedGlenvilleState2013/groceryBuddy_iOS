//
//  User.swift
//  groceryBuddy
//


import Foundation
import UIKit

class User: NSObject {
    let id: Int64?
    var email: String
    var password: String
    
    init(id: Int64) {
        self.id = id
        email = ""
        password = ""
    }
    
    init(id: Int64, email: String, password: String){
        self.id = id
        self.email = email
        self.password = password
    }


    
    
}
