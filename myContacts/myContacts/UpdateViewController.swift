//
//  UpdateViewController.swift
//  myContacts
//
//  Created by Emircan saglam on 16.06.2022.
//

import UIKit

class UpdateViewController: UIViewController {
    @IBOutlet weak var contactsName: UITextField!
    @IBOutlet weak var contactsNum: UITextField!
    
    var contact : Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = contact {
            
            contactsName.text = c.contacts_name
            contactsNum.text = c.contacts_num
            
        }
        
        
    }
    @IBAction func updateButton(_ sender: Any) {
        
        if let c = contact, let name = contactsName.text, let num = contactsNum.text {
            c.contacts_name = name
            c.contacts_num = num
            
            appDelegate.saveContext()
            _ = navigationController?.popViewController(animated: true)
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
