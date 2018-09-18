//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Fall Thiam on 2018-09-17.
//  Copyright © 2018 diversussum. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    @IBOutlet weak var addItemFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never //we do not show a title
    }


    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
