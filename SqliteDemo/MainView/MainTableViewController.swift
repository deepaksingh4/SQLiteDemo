//
//  MainTableViewController.swift
//  SqliteDemo
//
//  Created by Deepak Singh07 on 3/3/23.
//

import UIKit
import SQLite3

class MainTableViewController: UITableViewController {
    
    lazy var viewModel : ContactBusinessLogic = MainTableViewModel(controller: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        fetchContacts()
    }
    
    func fetchContacts() {
        viewModel.fetchContacts()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}


extension MainTableViewController : ContactsController{
    
    func updateContactList(contactList: [ContactUIModel]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
