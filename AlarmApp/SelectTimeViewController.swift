//
//  SelectTimeViewController.swift
//  AlarmApp
//
//  Created by Grace Ding on 7/20/16.
//  Copyright © 2016 Grace Ding. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {
    
    var time: String = ""
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var selectedTime: UILabel!
    
    @IBAction func selectTime(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var strTime = dateFormatter.stringFromDate(timePicker.date)
        self.selectedTime.text = strTime
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddAlarm" {
            let alarmTableViewController = segue.destinationViewController as! AlarmTableViewController
            
            alarmTableViewController.receivedString = timePicker.date as! String
        }
    }
}