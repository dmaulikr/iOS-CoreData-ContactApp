//
//  ContactCellTableViewCell.swift
//  MyContacts
//
//  Created by Yawo Echitey on 4/3/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import UIKit

class ContactCellTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneLabel: UILabel!
    @IBOutlet weak var contactEmailLabel: UILabel!
    
    
    func configureCell(contact: Contact){
        contactNameLabel.text = contact.name
        contactPhoneLabel.text = contact.phone
        contactEmailLabel.text = contact.email
        contactImage.image = contact.image as? UIImage
    }
}
