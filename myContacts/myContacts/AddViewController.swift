//
//  AddViewController.swift
//  myContacts
//
//  Created by Emircan saglam on 16.06.2022.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var contactsNameTextField: UITextField!
    @IBOutlet weak var contactsNumTextField: UITextField!
    
    let context = appDelegate.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        if let name = contactsNameTextField.text , let num = contactsNumTextField.text {
            let contact = Contacts(context: context)
            contact.contacts_name = name
            contact.contacts_num = num
            
            appDelegate.saveContext()
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
