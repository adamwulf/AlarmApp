//
//  NameRecordingViewController.swift
//  AlarmApp
//
//  Created by Grace Ding on 7/29/16.
//  Copyright © 2016 Grace Ding. All rights reserved.
//

import Foundation
import UIKit

class NameRecordingViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var nameRecording: UITextField!
    
    @IBAction func saveRecording(sender: AnyObject) {
        performSegueWithIdentifier("name", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "name" {
            let soundTableViewController = segue.destinationViewController as! SoundTableViewController
            
            soundTableViewController.receivedString = nameRecording.text!
        }
    }
}