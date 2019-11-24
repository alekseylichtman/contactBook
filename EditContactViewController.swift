//
//  EditContactViewController.swift
//  Phone_2.0
//
//  Created by Oleksii Kolakovskyi on 10/26/19.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit

class EditContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var contact: ContactsFormat!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    @IBOutlet weak var contactImage: UIImageView!
    var contactImagePicked: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactImage.layer.cornerRadius = 42
        
        if contact.photo == nil {
            contactImage.image = UIImage.init(named: "defaultavatar")
        } else { contactImage.image = contact.photo}
        nameTextField.text = contact.name
        lastNameTextField.text = contact.lastName
        phoneTextField.text = contact.number
        notesTextField.text = contact.notes
        
    }
    
    @IBAction func addImageButtonTapped(_ sender: Any) {
        showAlert()
        
    }
    
    
    @IBAction func saveNewContactButtonTapped(_ sender: UIButton) {
        
        contact.name = nameTextField.text ?? ""
        contact.lastName = lastNameTextField.text ?? ""
        contact.number = phoneTextField.text ?? ""
        contact.notes = notesTextField.text ?? ""
        contact.photo = contactImage.image

        navigationController?.popViewController(animated: true)
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera) }))
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary) }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //get image from source type
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        
        //Check is source type available
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        contactImagePicked = info[.originalImage] as? UIImage
        contactImage.image = contactImagePicked
        picker.dismiss(animated: true)
    }
}





