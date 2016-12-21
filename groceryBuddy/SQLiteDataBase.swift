//
//  SQLiteDataBase.swift
//  groceryBuddy
//
//  Created by RubyThree on 12/6/16.
//  Copyright © 2016 RubyThree. All rights reserved.
//

import Foundation
import UIKit

class SQLiteDataBase {

//    enum DataAccessError: Error {
//        case datastore_Connection_Error
//        case insert_Error
//        case delete_Error
//        case search_Error
//        case nil_In_Data
//    }
    
   func openDatabase() -> OpaquePointer {
        var db: OpaquePointer? = nil
    
        if sqlite3_open("/Users/rubythree/Documents/xcode_projs/groceryBuddy/grocerybuddy/grocery.db", &db) == SQLITE_OK {
            
                print("Successfully opened connection to database")
                return db!
            
        } else {
            print("Failed to open file")

        }
    return db!
    }
    
    let createTableString = "CREATE TABLE Contact(" + "Id INT PRIMARY KEY NOT NULL," + "Name CHAR(255));"
    
    func createTable() {
        
        var createTableStatement: OpaquePointer? = nil
        
        let db: OpaquePointer = openDatabase()
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            // 3
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Contact table created.")
            } else {
                print("Contact table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        // 4
        sqlite3_finalize(createTableStatement)
        
        sqlite3_close(db)
    }
    
    let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
    
    func updateDatabase(_ dbCommand: String)
    {
        var updateStatement: OpaquePointer? = nil
        
        let db: OpaquePointer = openDatabase()
        
        if sqlite3_prepare_v2(db, dbCommand, -1, &updateStatement, nil) == SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                //do nothing
            } else {
                print("Could not updateDatabase")
            }
        } else {
            print("updateDatabase dbCommand could not be prepared")
        }
        
        sqlite3_finalize(updateStatement)
        
        sqlite3_close(db)
        
    }


  }
