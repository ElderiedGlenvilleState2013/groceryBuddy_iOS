//
//  User.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/7/16.
//  Copyright © 2016 RubyThree. All rights reserved.
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
