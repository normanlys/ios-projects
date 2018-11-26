//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Norman Lim on 24/11/2018.
//  Copyright © 2018 Norman Lim. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController {
    
    weak var deleagte: ItemDetailViewControllerDelegate?
    weak var todoList: TodoList?
    weak var itemToEdit: ChecklistItem?

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: Any) {

        deleagte?.ItemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit, let text = textfield.text { // if editing
            item.text = text
            deleagte?.ItemDetailViewController(self, didFinishEditing: item)
        } else { // if adding
            if let item = todoList?.newTodo() {
                if let textFieldText = textfield.text {
                    item.text = textFieldText
                }
                item.checked = false
                deleagte?.ItemDetailViewController(self, didFinishAdding: item)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit { // display item to edit
            title = "Edit Item"
            textfield.text = item.text
            addBarButton.isEnabled = true
        }
        textfield.delegate = self
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textfield.becomeFirstResponder() // focus textfields when entering the screen
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? { // disallow users to select the cell itself
        return nil
    }
}

extension ItemDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // disable bar button when textfield is empty
        guard let oldText = textfield.text,
              let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        addBarButton.isEnabled = !newText.isEmpty
        return true
    }
}
