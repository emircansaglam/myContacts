//
//  ViewController.swift
//  myContacts
//
//  Created by Emircan saglam on 16.06.2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var contactsList = [Contacts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllContacts()
        tableView.reloadData()
    }
    
    func getAllContacts() {
        
        do {
            contactsList = try context.fetch(Contacts.fetchRequest())
        } catch  {
            print(error)
        }
        
    }
    func makeSearch(contactsName: String) {
        let fetchRequest:NSFetchRequest<Contacts> = Contacts.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "contacts_name CONTAINS %@", contactsName)
        
        
        do {
            contactsList = try context.fetch(fetchRequest)
        } catch  {
            print(error)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        
        if segue.identifier == "ToDetail" {
            let chosenVc = segue.destination as! DetailsViewController
            chosenVc.contact = contactsList[index!]
        }
        if segue.identifier == "ToUpdate" {
            let chosenVc = segue.destination as! UpdateViewController
            chosenVc.contact = contactsList[index!]
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contact = contactsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath) as! ContactsTableViewCell
        
        cell.contactsWordLabel.text = "\(contact.contacts_name!) - \(contact.contacts_num!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ToDetail", sender: indexPath.row)
    }
    

    // güncel kodlama yapısı trailingSwipeAction. didSelectRowAt ios 13.0 de kaldırıldı :)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, boolValue in
            let contacts = self.contactsList[indexPath.row]
            self.context.delete(contacts)
            appDelegate.saveContext()
            self.getAllContacts()
            self.tableView.reloadData()
        }
        let updateAction = UIContextualAction(style: .normal, title: "Update") { contextualAction, view, boolValue in
            
            print("clicked Update\(self.contactsList[indexPath.row])")
            self.performSegue(withIdentifier: "ToUpdate", sender: indexPath.row)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction,updateAction])
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonuç : \(searchText)")
        
        if searchText == "" {
            getAllContacts()
        }else{
            makeSearch(contactsName: searchText)
        }
        
        tableView.reloadData()
    }
    
}

