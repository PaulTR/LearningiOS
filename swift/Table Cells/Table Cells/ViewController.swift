//
//  ViewController.swift
//  Table Cells
//
//  Created by Paul Ruiz on 3/16/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let cellTableIdentifier = "CellTableIdentifer"
    @IBOutlet var tableView:UITableView!
    let computers = [
        ["Name" : "Macbook Air", "Color" : "Silver" ],
        ["Name" : "Macbook Pro", "Color" : "Silver" ],
        ["Name" : "iMac", "Color" : "Silver" ],
        ["Name" : "Mac Mini", "Color" : "Silver" ],
        ["Name" : "Mac Pro", "Color" : "Black" ]
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(NameAndColorCellTableViewCell.self, forCellReuseIdentifier: cellTableIdentifier)
        
        let nib = UINib( nibName: "NameAndColorCell", bundle: nil )
        tableView.registerNib( nib, forCellReuseIdentifier: cellTableIdentifier )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return computers.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(
                cellTableIdentifier, forIndexPath: indexPath)
                as NameAndColorCellTableViewCell
            let rowData = computers[indexPath.row]
            cell.name = rowData["Name"]!
            cell.color = rowData["Color"]!
            
            return cell
    }
    
}