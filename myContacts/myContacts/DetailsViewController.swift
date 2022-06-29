//
//  DetailsViewController.swift
//  myContacts
//
//  Created by Emircan saglam on 16.06.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var contactsName: UILabel!
    @IBOutlet weak var contactsNum: UILabel!
    
    var contact : Contacts?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let c = contact {
            contactsName.text = c.contacts_name
            contactsNum.text = c.contacts_num
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
