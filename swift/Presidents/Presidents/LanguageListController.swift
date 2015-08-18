//
//  LanguageListController.swift
//  Presidents
//
//  Created by Paul Trebilcox on 8/17/15.
//  Copyright (c) 2015 ptrprograms. All rights reserved.
//

import UIKit

class LanguageListController: UITableViewController {

    weak var detailViewController: DetailViewController? = nil
    private let languageNames: [String] = ["English", "French", "German", "Spanish"]
    private let languageCodes: [String] = ["en", "fr", "de", "es"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clearsSelectionOnViewWillAppear = false
        preferredContentSize = CGSizeMake(320, CGFloat(languageCodes.count * 44))
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return languageCodes.count;
    }
    
    override func tableView(tableView: UITableView,
            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
            forIndexPath: indexPath) as! UITableViewCell
            // Configure the cell...
            cell.textLabel?.text = languageNames[indexPath.row]
            return cell
    }
    
    override func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
        detailViewController?.languageString = languageCodes[indexPath.row]
    }
}
