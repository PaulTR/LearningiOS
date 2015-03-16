//
//  BlueViewController.swift
//  View Switcher
//
//  Created by Paul Ruiz on 3/3/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func blueButtonPressed( sender: UIButton ) {
        let alert = UIAlertController( title: "Blue View Button Pressed",
            message: "You pressed the button on the blue view",
            preferredStyle: .Alert )
        
        let action = UIAlertAction( title: "Yup",
            style: .Default,
            handler: nil )
        
        alert.addAction( action )
        
        presentViewController( alert, animated: true, completion: nil )
    }
}
