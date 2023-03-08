//
//  ContactsUseCase.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/7/23.
//

import Foundation

class ContactsUseCase {
    let contactManager: SqliteManager<ContactModel> = SqliteManager(dbName: "s")
    func saveContact(contact: ContactUIModel){
//        let contactModel = ContactModel(name: <#String#>, address: <#String#>, phone: <#String#>)
        //        contactManager.save(conact)
        
    }
    
    func getContacts() -> [ContactUIModel]{
        
        let sqliteManager: SqliteManager<ContactModel> = SqliteManager(dbName: "s")
        var contacts : [ContactUIModel] = []
        Task {
            do {
                let con = try await sqliteManager.read()
                return ContactAdaptor().getContactUIModels(contacts: con)
            } catch {
                debugPrint("Issue while fetching contacts")
                return []
            }
        }
        return contacts
    }
}
