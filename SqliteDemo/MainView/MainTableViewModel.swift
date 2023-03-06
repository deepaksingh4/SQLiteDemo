//
//  MainTableViewModel.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/6/23.
//

import Foundation

protocol ContactBusinessLogic{
    func fetchContacts()
    func addContact(contact: ContactModel)
    func updateContact(contact: ContactModel)
}

protocol ContactsController{
    func updateContactList(contactList: [ContactModel])
}


class MainTableViewModel {
    var controller : ContactsController
    
    init(controller: ContactsController) {
        self.controller = controller
    }
    
    var contacts : [ContactModel] = []
}

extension MainTableViewModel: ContactBusinessLogic{
    
    func fetchContacts() {
        let sqliteManager = SqliteManager(dbName: "s", type: ContactModel())
        
        Task.init {
            do {
                contacts = try await sqliteManager.read()
                controller.updateContactList(contactList: contacts)
            } catch {
                debugPrint("Issue while fetching contacts")
            }
        }
    }
    
    func addContact(contact: ContactModel) {
        
    }
    
    func updateContact(contact: ContactModel) {
        
    }
    
    
}
