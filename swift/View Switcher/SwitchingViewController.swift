//
//  SwitchingViewController.swift
//  View Switcher
//
//  Created by Paul Ruiz on 3/3/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    private var yellowViewController: YellowViewController!
    private var blueViewController: BlueViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        blueViewController = storyboard?.instantiateViewControllerWithIdentifier( "Blue" )
            as BlueViewController
        
        blueViewController.view.frame = view.frame
        
        switchViewController( from: nil, to: blueViewController )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if blueViewController != nil && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        
        if yellowViewController != nil && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
    }
    
    @IBAction func switchViews( sender: UIBarButtonItem ) {
        //Create a view controller if necessary
        createViewControllerIfNecessary()
        
        UIView.beginAnimations( "View Flip", context: nil )
        UIView.setAnimationDuration( 0.4 )
        UIView.setAnimationCurve( .EaseInOut )
        
        //Switch view controllers
        if blueViewController != nil && blueViewController!.view.superview != nil {
            UIView.setAnimationTransition( .CurlUp, forView: view, cache: true )
            yellowViewController.view.frame = view.frame
            switchViewController( from: blueViewController, to: yellowViewController )
        } else {
            UIView.setAnimationTransition( .FlipFromLeft, forView: view, cache: true )
            blueViewController.view.frame = view.frame
            switchViewController( from: yellowViewController, to: blueViewController )
        }
        
        UIView.commitAnimations()
    }

    func createViewControllerIfNecessary() {
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController =
                    storyboard?.instantiateViewControllerWithIdentifier( "Yellow" )
                    as YellowViewController
            }
        } else if blueViewController?.view.superview == nil {
            if blueViewController == nil {
                blueViewController =
                    storyboard?.instantiateViewControllerWithIdentifier( "Blue" )
                    as BlueViewController
            }
        }
    }
    
    private func switchViewController( from fromVC: UIViewController?, to toVC: UIViewController? ) {
        if fromVC != nil {
            fromVC!.willMoveToParentViewController( nil )
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
            self.addChildViewController( toVC! )
            self.view.insertSubview( toVC!.view, atIndex: 0 )
            toVC!.didMoveToParentViewController( self )
        }
    }
}
