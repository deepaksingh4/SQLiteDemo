//
//  TableModel.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/6/23.
//

import Foundation

protocol TableModel {
    var tableName: String {get}
    func getInsertQuery() -> String
    func getUpdateQuery() -> String
    func getCreateQuery() -> String
}
