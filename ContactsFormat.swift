//
//  Contacts.swift
//  Phone_2.0
//
//  Created by Oleksii Kolakovskyi on 10/24/19.
//  Copyright © 2019 Aleksey. All rights reserved.
//


import Foundation
import UIKit

var contacts = [ContactsFormat]()

class ContactsFormat: NSObject, NSCoding {
    
    var name: String = ""
    var lastName: String? = ""
    var number: String?
    var photo: UIImage?
    var notes: String? 
    
    init(name: String, lastName: String?, number: String?, photo: UIImage?, notes: String?) {
        self.name = name
        self.lastName = lastName
        self.number = number
        self.photo = photo
        self.notes = notes
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.lastName = coder.decodeObject(forKey: "lastName") as? String
        self.number = coder.decodeObject(forKey: "lastName") as? String
        self.photo = coder.decodeObject(forKey: "photo") as? UIImage
        self.notes = coder.decodeObject(forKey: "notes") as? String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(lastName, forKey: "lastName")
        coder.encode(number, forKey: "number")
        coder.encode(photo, forKey: "photo")
        coder.encode(notes, forKey: "notes")
    }

    static func loadSampleContacts() -> [ContactsFormat] {
        let contact1 = ContactsFormat(name: "George", lastName: "Bukovski", number: "847-543-5837", photo: nil, notes: "Eye Doctor")
        let contact2 = ContactsFormat(name: "Katie", lastName: "Warshteiner", number: "884-527-1257", photo: nil, notes: "Random girl from a bar")
        let contact3 = ContactsFormat(name: "Bob", lastName: "Walington", number: "", photo: nil, notes: "Truck Driver")
        
        return [contact1, contact2, contact3]
    }
    
    static func loadSavedContacts() {
        let encodedData = UserDefaults.standard.object(forKey: "contacts") as? Data
        if encodedData != nil {
            let local_contacts = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedData!) as? [ContactsFormat]
            contacts = (local_contacts ?? [])
        } else {
            contacts = []
        }
    }
    
    static func addNewContact(firstName: String, lastName: String, number: String, photo: UIImage?, notes: String) -> ContactsFormat{
        
        let newContact = ContactsFormat(name: firstName,
                                        lastName: lastName,
                                        number: number,
                                        photo: photo,
                                        notes: notes)
        contacts.append(newContact)
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: contacts)
        UserDefaults.standard.setValue(encodedData, forKeyPath: "contacts")
        UserDefaults.standard.synchronize()
        
        return newContact
    }
}


