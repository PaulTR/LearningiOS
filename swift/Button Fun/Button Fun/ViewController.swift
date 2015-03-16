//
//  ViewController.swift
//  Button Fun
//
//  Created by Paul Ruiz on 2/28/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func buttonPressed(sender: UIButton) {
        let title = sender.titleForState( .Normal )!
        let plainText = "\(title) button pressed"
//        statusLabel.text = plainText
        let styledText = NSMutableAttributedString( string: plainText )
        let attributes = [ NSFontAttributeName: UIFont.italicSystemFontOfSize( statusLabel.font.pointSize ) ]
        let nameRange = ( plainText as NSString ).rangeOfString( title )
        styledText.setAttributes( attributes, range: nameRange )
        
        statusLabel.attributedText = styledText
        
        statusLabel.attributedText = styledText
    }
}

