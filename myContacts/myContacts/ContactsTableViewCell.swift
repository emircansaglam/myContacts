//
//  ContactsTableViewCell.swift
//  myContacts
//
//  Created by Emircan saglam on 16.06.2022.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    @IBOutlet weak var contactsWordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
