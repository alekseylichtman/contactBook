//
//  ViewController.swift
//  Phone_2.0
//
//  Created by Oleksii Kolakovskyi on 10/24/19.
//  Copyright © 2019 Aleksey. All rights reserved.

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var contactsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactsFormat.loadSavedContacts()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contactsTable.reloadData()
        contacts.sort { (contact1, contact2) -> Bool in
            contact1.name.lowercased() < contact2.name.lowercased()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            contactsTable.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showContactsInfo", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCellIdentifier") as! ContactTableViewCell
        
        cell.contactName.text = "\(contacts[indexPath.row].name) \(contacts[indexPath.row].lastName! )"
        if contacts[indexPath.row].photo == nil {
            cell.contactImage.image = UIImage.init(named: "defaultavatar")
            
        } else {
            cell.contactImage.image = contacts[indexPath.row].photo
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showContactsInfo" {
            let profileController = segue.destination as! ProfileViewController
            let indexPath = contactsTable.indexPathForSelectedRow!
            let selectedContact = contacts[indexPath.row]
            profileController.contact = selectedContact
        }
    }
}
