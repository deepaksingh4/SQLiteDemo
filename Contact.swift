//
//  Contact.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/8/23.
//

import Foundation

protocol Contact {
    var name: String {get set}
    var address: String {get set}
    var phone: String {get set}
    var id: Int {get set}
}
