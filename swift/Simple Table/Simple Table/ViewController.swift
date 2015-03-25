//
//  ViewController.swift
//  Simple Table
//
//  Created by Paul Ruiz on 3/16/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let dwarves = [
        "Sleepy",
        "Sneezy",
        "Bashful",
        "Happy",
        "Doc",
        "Grumpy",
        "Dopey",
        "Thorin",
        "Dorin",
        "Nori",
        "Ori",
        "Balin",
        "Dwalin",
        "Fili",
        "Kili",
        "Oin",
        "Gloin",
        "Bifur",
        "Bofur",
        "Bombur"
    ]
    
    let simpleTableIdentifier = "SimpleTableIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView( tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return dwarves.count;
    }
    
    func tableView( tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath ) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier( simpleTableIdentifier ) as? UITableViewCell
        
        if( cell == nil ) {
            cell = UITableViewCell( style: UITableViewCellStyle.Value1, reuseIdentifier: simpleTableIdentifier )
        }
        
        let image = UIImage( named: "star" )
        cell!.imageView?.image = image
        let highlightedImage = UIImage( named: "star2" )
        cell!.imageView?.highlightedImage = highlightedImage
        
        if( indexPath.row < 7 ) {
            cell!.detailTextLabel?.text = "Mr Disney"
        } else {
            cell!.detailTextLabel?.text = "Mr Tolkien"
        }
        
        cell!.textLabel?.font = UIFont .boldSystemFontOfSize(50)
        cell!.textLabel?.text = dwarves[ indexPath.row ]
        return cell!
    }
    
    //Set the indention level of the row
    func tableView( tableView: UITableView,
        indentationLevelForRowAtIndexPath indexPath: NSIndexPath ) -> Int {
            return indexPath.row % 4
    }
    
    //Set the first row as unselectable
    func tableView( tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath ) -> NSIndexPath? {
        if indexPath.row == 0 {
            return nil
        } else {
            return indexPath
        }
    }
    
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath)
        -> CGFloat {
            return indexPath.row == 0 ? 120 : 70
    }
    
    //Called after a row is selected
    func tableView( tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath ) {
        let rowValue = dwarves[indexPath.row]
        let message = "You selected \(rowValue)"
        
        let controller = UIAlertController( title: "Row Selected", message: message, preferredStyle: .Alert )
        let action = UIAlertAction( title: "Yup", style: .Default, handler: nil )
        controller.addAction( action )
        presentViewController( controller, animated: true, completion: nil )
    }

}

