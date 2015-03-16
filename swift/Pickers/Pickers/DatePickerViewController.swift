//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by Paul Ruiz on 3/4/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let date = NSDate()
        datePicker.setDate( date, animated: false )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func buttonPressed(sender: UIButton) {
        
        let date = datePicker.date
        let message = "The date and time you selected is \(date)"
        let alert = UIAlertController(
                title: "Date and Time Selected",
                message: message,
            preferredStyle: .Alert )
        
        let action = UIAlertAction(
                title: "Yup",
                style: .Default,
                handler: nil )
        
        alert.addAction( action )
        presentViewController( alert, animated: true, completion: nil )
    }
}
