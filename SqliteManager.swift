//
//  SqliteManager.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/3/23.
//

import Foundation
import SQLite3


class SqliteManager<T: TableModel> {
    
    var model: T?
    var db:OpaquePointer?
    init(dbName: String){
        db = openDatabase(dbName: dbName)
        createTable()
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
        var createTableQuery: OpaquePointer?
        if sqlite3_prepare_v2(db,T.createTableQuery, -1, &createTableQuery, nil) == SQLITE_OK{
            
            if sqlite3_step(createTableQuery) == SQLITE_DONE {
                print("Table created")
            }else{
                print("Table not created")
            }
        }else{
            print("Query not prepared")
        }
    }
    
    
    
    
    func write() async {
        let insertQuery = model?.getInsertQuery()
        var insertStatement : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            
        }
    }
    
    func read() async throws-> [T]{
        
        var readQuery: OpaquePointer?
        
        if sqlite3_prepare_v2(db,T.getReadQuery, -1, &readQuery, nil) == SQLITE_OK{
            
            if sqlite3_step(readQuery) == SQLITE_ROW {
               
                let id = sqlite3_column_int(readQuery, 0)
                let name = sqlite3_column_text(readQuery, 1)
                print("data retreived \(name)")
            }else{
                print("Table not created")
            }
        }else{
            print("Query not prepared")
        }
        
        return []
    }
    
    
}
