//
//  SqliteManager.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/3/23.
//

import Foundation
import SQLite3


class SqliteManager<T: TableModel> {
    
    var db:OpaquePointer?
    var model: T
    init(dbName: String, type: T){
        self.model = type
        db = openDatabase(dbName: dbName)
    }
    
    func openDatabase(dbName: String = "contacts") -> OpaquePointer?
    {
        do{
            let filePath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appending(path: dbName.appending(".sqlite"))
            var db : OpaquePointer? = nil
            if sqlite3_open(filePath.path(), &db) != SQLITE_OK{
                print("Db not created")
                return nil
            }
            print("db created")
            return db
            
        }catch{
            print("Exception while creating db")
        }
        return nil
    }
    
    func createTable(){
            let createTable = "CREATE TABLE "
    }
    
    
    func write() async {
        let insertQuery = model.getInsertQuery()
        var insertStatement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            
        }
    }
    
    func read() async throws-> [T]{
        return []
    }
    
    
}
