//
//  ViewController.swift
//  Orientation
//
//  Created by Paul Ruiz on 3/2/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func supportedInterfaceOrientations() -> Int {
        return Int( UIInterfaceOrientationMask.Portrait.rawValue )
            | Int( UIInterfaceOrientationMask.LandscapeLeft.rawValue )
    }

}

