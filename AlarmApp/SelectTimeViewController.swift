//
//  SelectTimeViewController.swift
//  AlarmApp
//
//  Created by Grace Ding on 7/20/16.
//  Copyright © 2016 Grace Ding. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.blueColor()
    }
    
    var time: String = ""
    
    @IBOutlet weak var timePicker: UIDatePicker!
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "time" {
            let alarmTableViewController = segue.destinationViewController as! AlarmTableViewController
            let timeString = NSDateFormatter.localizedStringFromDate(timePicker.date, dateStyle: .NoStyle, timeStyle: .ShortStyle)
            alarmTableViewController.data.append(timeString)
            alarmTableViewController.tableView.reloadData()
        }
            
            
           /* else {
            let recordSoundViewController = segue.destinationViewController as! RecordSoundViewController
            let currentDate = NSDate()
            NSLog("(Current Short Time String = \(currentDate.toShortTimeString()))")
            print(currentDate.toShortTimeString)
            
            if recordSoundViewController.currentDate == NSDateFormatter.localizedStringFromDate(timePicker.date, dateStyle: .NoStyle, timeStyle: .ShortStyle) {
                print ("yes")
                
            }
        }*/
    }

    
}