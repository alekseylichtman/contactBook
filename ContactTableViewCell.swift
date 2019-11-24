//
//  ViewControllerTableViewCell.swift
//  Phone_2.0
//
//  Created by Oleksii Kolakovskyi on 11/21/19.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contactImage.layer.cornerRadius = 25
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
