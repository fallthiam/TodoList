//
//  TodoList.swift
//  Checklist
//
//  Created by Fall Thiam on 2018-09-13.
//  Copyright © 2018 diversussum. All rights reserved.
//

import Foundation

class TodoList {
    
    var todos: [ChecklistItem] = []
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Walk the dog"
        row2Item.text = "Cook something"
        row3Item.text = "Work"
        row4Item.text = "Another thing"
        
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
    }
    
    
}
