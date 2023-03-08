//
//  TableModel.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/6/23.
//

import Foundation

protocol TableModel {
    static var tableName: String {get}
    static var createTableQuery: String {get}
    func getInsertQuery() -> String
    func getUpdateQuery() -> String
    func getCreateQuery() -> String
    static var getReadQuery: String {get}
}
