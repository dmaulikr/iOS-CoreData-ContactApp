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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchContactTypes()
        
        typePicker.dataSource = self
        typePicker.delegate = self

        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
        print("SAVING ITEM")
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
}
