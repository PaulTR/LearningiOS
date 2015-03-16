//
//  ViewController.swift
//  Control Fun
//
//  Created by Paul Ruiz on 3/1/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    override func viewDidLoad() {
        sliderLabel.text = "50"
    }
    
    @IBAction func textFieldDoneEditing( sender: UITextField ) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap( Sender: UIControl ) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    @IBAction func sliderChanged(sender: UISlider) {
        let progress = lroundf( sender.value )
        sliderLabel.text = "\(progress)"
    }
    @IBAction func switchChange(sender: UISwitch) {
        let setting = sender.on
        leftSwitch.setOn( setting, animated: true )
        rightSwitch.setOn( setting, animated: true )
    }
    
    @IBAction func toggleControls(sender: UISegmentedControl) {
        //Toggle control is 0 indexed
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.hidden = false;
            rightSwitch.hidden = false;
            doSomethingButton.hidden = true;
        } else { //selectedSegmentIndex == 1
            leftSwitch.hidden = true;
            rightSwitch.hidden = true;
            doSomethingButton.hidden = false;
        }
    }
    
    @IBAction func buttonPressed(sender: UIButton) {

        let controller = UIAlertController( title: "Are you sure?", message: nil, preferredStyle: .ActionSheet )
        
        let yesAction = UIAlertAction( title: "Yes, I'm sure!",
            style: .Destructive,
            handler: {
                    action in let msg = self.nameField.text.isEmpty
                        ? "Everything went OK."
                        : "Everything went OK, \(self.nameField.text)"
                
                let controller2 = UIAlertController(
                    title: "Something was done",
                    message: msg,
                    preferredStyle: .Alert )
                
                let cancelAction = UIAlertAction( title: "Phew",
                    style: .Cancel,
                    handler: nil )
                
                controller2.addAction( cancelAction )
                
                self.presentViewController( controller2, animated: true, completion: nil )
                
            }
        )
        
        let noAction = UIAlertAction( title: "Nope",
            style: .Cancel,
            handler: nil )
        
        controller.addAction( yesAction )
        controller.addAction( noAction )
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
//            ppc.permittedArrowDirections = .Left
        }
        
        presentViewController( controller, animated: true, completion: nil )
    }
}

