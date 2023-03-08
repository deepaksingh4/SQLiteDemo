//
//  MainTableViewModel.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/6/23.
//

import Foundation

protocol ContactBusinessLogic{
    func fetchContacts()
    func addContact(contact: ContactUIModel)
    func updateContact(contact: ContactUIModel)
}

protocol ContactsController{
    func updateContactList(contactList: [ContactUIModel])
}


class MainTableViewModel {
    var controller : ContactsController
    var useCase: ContactsUseCase = ContactsUseCase()
    init(controller: ContactsController) {
        self.controller = controller
    }
    
    var contacts : [ContactUIModel] = []
}

extension MainTableViewModel: ContactBusinessLogic{
    
    func fetchContacts() {
        //call to use case for getting contacts
        let contacts = useCase.getContacts()
        controller.updateContactList(contactList: contacts)
    }
    
    func addContact(contact: ContactUIModel) {
        //call use case
    }
    
    func updateContact(contact: ContactUIModel) {
        //call use case
    }
    
    
}
