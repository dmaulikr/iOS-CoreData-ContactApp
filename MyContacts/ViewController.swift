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
    
    var controller: NSFetchedResultsController<Contact>!
    
    @IBOutlet weak var contactTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contactTableView.delegate = self
        contactTableView.dataSource = self
        
        //seedDb()
        
        fetchResult()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCellTableViewCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureCell(cell: ContactCellTableViewCell, indexPath: NSIndexPath){
        let contact = controller.object(at: indexPath as IndexPath)
        cell.configureCell(contact: contact)
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        contactTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        contactTableView.endUpdates()
    }
    
    func fetchResult(){
        let request: NSFetchRequest<Contact> = Contact.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [nameSort]
        let _controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = _controller
        
        do{
            try _controller.performFetch()
        }catch{
            let error = error as NSError
            print("\(error)")
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            
        case .insert:
            if let indexPath = newIndexPath {
                contactTableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        
        case .delete:
            if let indexPath = indexPath {
                contactTableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case .update:
            if let indexPath = indexPath{
                let cell = contactTableView.cellForRow(at: indexPath) as! ContactCellTableViewCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
            
        case .move:
            if let indexPath = indexPath{
                contactTableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath{
                contactTableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    func seedDb(){
        let contact1 = Contact(context: context)
        contact1.name = "Kodjovi Toguin"
        contact1.phone = "90 833 94"
        contact1.email = "kodjo@tg.tg"
        
        let contact2 = Contact(context: context)
        contact2.name = "Ancien Yawo"
        contact2.phone = "90 847 94"
        contact2.email = "ancien@tg.tg"
        
        let contact3 = Contact(context: context)
        contact3.name = "Toto Gowu Donut"
        contact3.phone = "90 847 00"
        contact3.email = "magic@tg.tg"
        
        ad.saveContext()
        
    }
    

}

