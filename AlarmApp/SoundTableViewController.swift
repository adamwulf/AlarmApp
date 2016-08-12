//
//  SoundTableViewController.swift
//  AlarmApp
//
//  Created by Grace Ding on 7/11/16.
//  Copyright © 2016 Grace Ding. All rights reserved.
//

import UIKit
import AVFoundation

class SoundTableViewController: UITableViewController {
    @IBOutlet weak var newSound: UIButton!
    
    var receivedString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SoundTableViewController.userClickOnSave(_:)), name: "userClickOnSave", object: nil)
        self.tableView?.backgroundColor = UIColor.whiteColor()
    }
    
//    func userClickOnSave(notification:NSNotification){
//        let object = notification.object as! String
//        self.data.append(object)
//        self.tableView.reloadData()
//    }
    
    
    var data = [String]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SoundCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        
        
        // Configure the cell...
        return cell
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            data.removeAtIndex(indexPath.row)
            
            tableView.reloadData()
        }
    }
    
    //Set-up AudioPlayer
    var soundPlayer: AVAudioPlayer!
    
    func preparePlayer() {
        var error: NSError?
        do {
            soundPlayer = try AVAudioPlayer(contentsOfURL: getFileURL())
        } catch let error1 as NSError {
            error = error1
        }
        
        if let err = error {
            print("AVAudioPlayer error: \(err.localizedDescription)")
        } else {
            //soundPlayer.delegate = self
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 1.0
        }
    }
    
    func getFileURL() -> NSURL {
        
        let path = NSTemporaryDirectory().stringByAppendingString(".caf")
        print("path is :\(path)")
        let filePath = NSURL(fileURLWithPath: path)
        
        print("filePath is :\(filePath)")
        return filePath
    }
    
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        NSLog("You selected: \(data[indexPath.row])!")
        print("playing")
        soundPlayer.prepareToPlay()
        soundPlayer.play()
        //self.performSegueWithIdentifier("yourIdentifier", sender: self)
    }
    
    
    
    @IBAction func unwindToSoundTableViewController(segue: UIStoryboardSegue) {
        
    }

}


