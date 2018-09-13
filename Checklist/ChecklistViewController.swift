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
    
    required init?(coder aDecoder: NSCoder) {
        todoList = TodoList()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //return the number of cells we have
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    // This function is called to building the view everytime a cell appears in the screen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        if let label = cell.viewWithTag(1000) as? UILabel {
            let currentRow = indexPath.row
            label.text = todoList.todos[currentRow].text
        }
        configureCheckmark(cell: cell, indexPath: indexPath)
        return cell
    }
    
    //when tape to select a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            configureCheckmark(cell: cell, indexPath: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //this is used to configure the checkmark of a cell when we tape on it
    func configureCheckmark(cell:UITableViewCell, indexPath: IndexPath) {
        let currentRow = indexPath.row
        if todoList.todos[currentRow].checked {
            cell.accessoryType = .none
        }
        else {
            cell.accessoryType = .checkmark
        }
        todoList.todos[currentRow].checked = !todoList.todos[currentRow].checked
    }
    


}

