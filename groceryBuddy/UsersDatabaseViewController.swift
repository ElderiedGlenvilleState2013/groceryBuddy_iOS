//
//  UserDatabaseViewController.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/6/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import Foundation

class UsersDatabaseViewController: NSObject{
    
    let filename: String = "..."
    typealias sqlite3ptr = COpaquePointer
    var db: sqlite3ptr = nil
    let result = sqlite3_open(filename, &db)
}