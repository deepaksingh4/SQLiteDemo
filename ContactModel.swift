//
//  ContactModel.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/6/23.
//

import Foundation

struct ContactModel: TableModel{
    
    var tableName: String {
        get{
            return "Contacts"
        }
    }
    
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
