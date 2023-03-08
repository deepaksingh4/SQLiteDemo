//
//  ContactAdaptor.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/8/23.
//

import Foundation

struct ContactAdaptor{
    
    func getContactUIModels(contacts: [ContactModel]) -> [ContactUIModel] {
        return contacts.map { object in
            return ContactUIModel(name:object.name , address: object.address, phone: object.phone, id: object.id)
        }
    }
}
