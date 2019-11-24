//
//  ProfileViewController.swift
//  Phone_2.0
//
//  Created by Oleksii Kolakovskyi on 10/25/19.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    var contact: ContactsFormat!
    
    
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editContact" {
            let profileController = segue.destination as! EditContactViewController
            profileController.contact = self.contact
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = 67
        if contact.photo == nil {
            profileImage.image = UIImage.init(named: "defaultavatar")
        } else { profileImage.image = contact.photo}
        
        
        fullName.text = "\(contact.name) \(contact.lastName ?? "no_lastname")"
        phoneNumber.text = contact.number ?? ""
        notes.text = contact.notes
        profileImage.image = contact.photo
        
        
        
    }
    
    
    
    
    
    
    
}

