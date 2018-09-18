//
//  ViewController.swift
//  Checklist
//
//  Created by Fall Thiam on 2018-09-10.
//  Copyright © 2018 diversussum. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var todoList: TodoList
    
    @IBAction func addItem(_ sender: Any) {
        let nextIndex = todoList.todos.count
        _ = todoList.newTodo() //this means that I am not interested by using the object returned by the function
        let indexPath = IndexPath(row: nextIndex, section: 0) //we create a new index to add the item to the tableView
        let indexPaths = [indexPath] // tableView only take arrays of indexPath to add item
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    required init?(coder aDecoder: NSCoder) {
        todoList = TodoList()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //return the number of cells we have
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    // This function is called to building the view everytime a cell appears in the screen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = todoList.todos[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    //when tape to select a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = todoList.todos[indexPath.row]
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //used to delete an item in 2 steps : first delet the item from the model, second delet the item from the view
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        todoList.todos.remove(at: indexPath.row) //we delete the item from the model the item
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .fade) //we delete the item from the view
        
    }
    
    //Setup the text of a cell
    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }
    
    //this is used to configure the checkmark of a cell when we tape on it
    func configureCheckmark(for cell:UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        item.toggleChecked()
    }
    
    


}

