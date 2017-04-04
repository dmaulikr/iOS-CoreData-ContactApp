//
//  ViewController.swift
//  MyContacts
//
//  Created by Yawo Echitey on 4/3/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellId = "contactCell"
    
    @IBOutlet weak var contactTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contactTableView.delegate = self
        contactTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? ContactCellTableViewCell{
            return cell
        }else{
            return UITableViewCell()
        }
    }
    

}

