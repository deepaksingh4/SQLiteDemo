//
//  ContactModel.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/6/23.
//

import Foundation

struct ContactModel: TableModel, Contact {
    static var getReadQuery: String {
        get {
            return "SELECT * FROM \(tableName)"
        }
    }
    
    var name: String
    
    var address: String
    
    var phone: String
    
    var id: Int
    
    
    
   static var tableName: String {
        get{
            return "Contacts"
        }
    }
    
    static  var createTableQuery = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
    
    func getInsertQuery() -> String {
        return ""
    }
    
    func getUpdateQuery() -> String {
        return ""
    }
    
    func getCreateQuery() -> String {
        return ""
    }
    
    
    
}
