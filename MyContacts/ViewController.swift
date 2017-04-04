//
//  ViewController.swift
//  MyContacts
//
//  Created by Yawo Echitey on 4/3/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var cellId = "contactCell"
    
    let controller: NSFetchedResultsController<Contact>!
    
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
    
    func fetchResult(){
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [nameSort]
        let _controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        do{
            try _controller.performFetch()
        }catch{
            let error = error as NSError
            print("\(error)")
        }
    }
    

}

