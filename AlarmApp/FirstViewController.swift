//
//  FirstViewController.swift
//  AlarmApp
//
//  Created by Grace Ding on 7/11/16.
//  Copyright © 2016 Grace Ding. All rights reserved.
//

import UIKit
import AudioToolbox

class FirstViewController: UIViewController {
    
    
    
    @IBOutlet weak var addNewAlarm: UIButton!
    
    //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert() {
        /*let alertController: UIAlertController = UIAlertController(title: "Cannot analyze", message: "Please enter some text.", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)*/

        // Get started
        SCLAlertView().showInfo("Important info", subTitle: "You are great")
        
        let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showSuccess("Hello World", subTitle: "This is a more descriptive text.")
        
        // Upon displaying, change/close view
        alertViewResponder.setTitle("New Title") // Rename title
        alertViewResponder.setSubTitle("New description") // Rename subtitle
        alertViewResponder.close() // Close view
        
        SCLAlertView().showError("Hello Error", subTitle: "This is a more descriptive error text.") // Error
        SCLAlertView().showNotice("Hello Notice", subTitle: "This is a more descriptive notice text.") // Notice
        SCLAlertView().showWarning("Hello Warning", subTitle: "This is a more descriptive warning text.") // Warning
        SCLAlertView().showInfo("Hello Info", subTitle: "This is a more descriptive info text.") // Info
        SCLAlertView().showEdit("Hello Edit", subTitle: "This is a more descriptive info text.") // Edit
        
        SCLAlertView().showTitle(
            "Congratulations", // Title of view
            subTitle: "Operation successfully completed.", // String of view
            duration: 2.0, // Duration to show before closing automatically, default: 0.0
            completeText: "Done", // Optional button value, default: ""
            style: .Success, // Styles - see below.
            colorStyle: 0xA429FF,
            colorTextButton: 0xFFFFFF
        )
        
        
    }
}

