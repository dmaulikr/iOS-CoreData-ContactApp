//
//  ContactDetailsViewController.swift
//  MyContacts
//
//  Created by Yawo Echitey on 4/5/17.
//  Copyright © 2017 Echitey. All rights reserved.
//

import UIKit
import CoreData

class ContactDetailsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var contactImageView: UIImageView!
    
    var types = [ContactType]()
    
    var selectedContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchContactTypes()
        
        typePicker.dataSource = self
        typePicker.delegate = self

        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        if selectedContact != nil{
            loadSelectedContact()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let type = types[row]
        return type.type
    }
    
    @IBAction func saveContact(_ sender: UIBarButtonItem){
        
        var contact: Contact!
        
        if selectedContact == nil{
            contact = Contact(context: context)
        }else{
            contact = selectedContact
        }
        
        
        if let name = nameTxt.text{
            contact.name = name
        }
        if let email = emailTxt.text{
            contact.email = email
        }
        if let phone = phoneTxt.text{
            contact.phone = phone
        }
        
        contact.toType = types[typePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteContact(_ sender: UIButton) {
        if selectedContact != nil{
            context.delete(selectedContact!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func fetchContactTypes(){
        let request:  NSFetchRequest<ContactType> = ContactType.fetchRequest()
        
        do{
            self.types = try context.fetch(request)
        }catch{
            //Error handling
            print("An Error occured during operation!")
        }
    }
    
    func loadSelectedContact(){
        if let contact = selectedContact{
            
            nameTxt.text = contact.name
            emailTxt.text = contact.email
            phoneTxt.text = contact.phone
            
            if let _type = contact.toType{
                var i = 0
                repeat{
                    
                    let tmpType = types[i]
                    if tmpType.type == _type.type{
                        typePicker.selectRow(i, inComponent: 0, animated: false)
                        break
                    }
                    i += 1
                    
                }while(i < types.count)
            }
        }
    }
}
