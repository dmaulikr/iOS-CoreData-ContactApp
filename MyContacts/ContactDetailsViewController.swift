//
//  ContactDetailsViewController.swift
//  MyContacts
//
//  Created by Yawo Echitey on 4/5/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
}
