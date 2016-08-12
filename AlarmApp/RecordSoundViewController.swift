//
//  RecordSoundViewController.swift
//  AlarmApp
//
//  Created by Grace Ding on 7/25/16.
//  Copyright © 2016 Grace Ding. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import RealmSwift

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var nameOfRecording: String = ""
    
    @IBAction func saveRecording(sender: AnyObject) {
        if (self.nameTextField.text!.isEmpty) {
            let alertController: UIAlertController = UIAlertController(title: "Name is Empty", message: "Please name your recording", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        
        else {
            self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
            self.performSegueWithIdentifier("name", sender: self)
        }
        
//        var tField: UITextField!
//        
//        func configurationTextField(textField: UITextField!)
//        {
//            print("generating the TextField")
//            textField.placeholder = "Name Your Recording"
//            tField = textField
//        }
//        
//        func handleCancel(alertView: UIAlertAction!)
//        {
//            print("Cancelled !!")
//        }
//        
//        var alert = UIAlertController(title: "Name Your Recording", message: "", preferredStyle: .Alert)
//        
//        alert.addTextFieldWithConfigurationHandler(configurationTextField)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler:handleCancel))
//        alert.addAction(UIAlertAction(title: "Done", style: .Default, handler:{ (UIAlertAction) in
//            print("Done !!")
//            var nameOfFile = alert.textFields![0].text
//            self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
//            NSNotificationCenter.defaultCenter().postNotificationName("userClickOnSave", object: nameOfFile)
//            self.nameOfRecording = nameOfFile!
    
//            URL: getFileURL()
//            
//            let path = NSTemporaryDirectory().stringByAppendingString("\(self.nameOfRecording).caf")
//            print("path is :\(path)")
//            let filePath = NSURL(fileURLWithPath: path)
//            
//            print("filePath is :\(filePath)")
            
//            let fileManager = NSFileManager.defaultManager()
//            
//            // Copy 'hello.swift' to 'subfolder/hello.swift'
//
//            do {
//                try fileManager.copyItemAtPath(NSTemporaryDirectory(), toPath: "\(self.nameOfRecording).caf")
//
//                print("new path: \(fileManager)")
//            }
//            catch let error as NSError {
//                print("Ooops! Something went wrong: \(error)")
//            }
            
//            
//            
//            print("Item : \(tField.text)")
//        }))
//        self.presentViewController(alert, animated: true, completion: {
//            print("completion block")
//        })
    }
    
    var soundRecorder: AVAudioRecorder!
    var soundPlayer: AVAudioPlayer!
    var isPlaying = false
    
    
    
    var nameOfFile: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        saveButton.enabled = false
        playButton.enabled = false
    }
    
    
    @IBAction func recordSound(sender: UIButton) {
        playButton.enabled = false
        if (sender.titleLabel?.text == "Start Recording"){
            soundRecorder.record()
            sender.setTitle("Stop Recording", forState: .Normal)
            playButton.enabled = false
        } else {
            soundRecorder.stop()
            sender.setTitle("Start Recording", forState: .Normal)
            saveButton.enabled = true
            playButton.enabled = true
        }
    }
    
    
    @IBAction func playSound(sender: UIButton) {
        if (sender.titleLabel?.text == "Play Recording"){
            //recordButton.enabled = false
            sender.setTitle("Stop Playing", forState: .Normal)
            preparePlayer()
            soundPlayer.play()
        } else {
            soundPlayer.stop()
            sender.setTitle("Play Recording", forState: .Normal)
        }
    }
    
    // MARK:- AVRecorder Setup
    
    func setupRecorder() {
        
        //set the settings for recorder
        
        let recordSettings = [AVSampleRateKey : NSNumber(float: Float(44100.0)),
                              AVFormatIDKey : NSNumber(int: Int32(kAudioFormatAppleLossless)),
                              AVNumberOfChannelsKey : NSNumber(int: 2),
                              AVEncoderAudioQualityKey : NSNumber(int: Int32(AVAudioQuality.Max.rawValue))];
        
        var error: NSError?
        
        do {
            //  soundRecorder = try AVAudioRecorder(URL: getFileURL(), settings: recordSettings as [NSObject : AnyObject])
            let audioSession = AVAudioSession.sharedInstance()
            try! audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord,withOptions: .DefaultToSpeaker)
            try! audioSession.setActive(true)
            soundRecorder =  try AVAudioRecorder(URL: getFileURL(), settings: recordSettings)
            
            
        } catch let error1 as NSError {
            error = error1
            soundRecorder = nil
        }
        
        if let err = error {
            print("AVAudioRecorder error: \(err.localizedDescription)")
        } else {
            soundRecorder.delegate = self
            
        }
    }
    
//    //Get Current Date
//    let currentDate = NSDate()
//    
//    func compareTime() {
//    //Test Extensions in Log
//    NSLog("(Current Short Time String = \(currentDate.toShortTimeString()))")
//    print(currentDate.toShortTimeString)
//    
//    }
    
    // MARK:- Prepare AVPlayer
    
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
            soundPlayer.delegate = self
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 1.0
        }
    }
    
    func audioPlayerDidFinishRecording(player: AVAudioRecorder, successfully flag: Bool) {
        saveButton.enabled = true
        playButton.enabled = true
    }
    
    
    // MARK:- File URL
    
    func getCacheDirectory() -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        
        return paths[0]
    }
    
    func getFileURL() -> NSURL {
        
//        let path = NSTemporaryDirectory().stringByAppendingString("\(nameTextField.text).caf")
        let path = NSTemporaryDirectory().stringByAppendingString(".caf")
        print("path is :\(path)")
        let filePath = NSURL(fileURLWithPath: path)
    
        print("filePath is :\(filePath)")
        
        return filePath
    }
    
    // MARK:- AVAudioPlayer delegate methods
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        recordButton.enabled = true
        playButton.setTitle("Play Recording", forState: .Normal)
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer, error: NSError?) {
        print("Error while playing audio \(error!.localizedDescription)")
    }
    
    // MARK:- AVAudioRecorder delegate methods
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        playButton.enabled = true
        recordButton.setTitle("Start Recording", forState: .Normal)
    }
    
    func audioRecorderEncodeErrorDidOccur(recorder: AVAudioRecorder, error: NSError?) {
        print("Error while recording audio \(error!.localizedDescription)")
    }
    
    // MARK:- didReceiveMemoryWarning
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Rename file with custom name
    
//    func copyItemAtPath(_ srcPath: String, toPath dstPath: String) throws {
//        
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "name" {
            let soundTableViewController = segue.destinationViewController as! SoundTableViewController
            
            soundTableViewController.data.append(nameTextField.text!)
        }
        
        
//        if segue.identifier == "sound" {
//            let soundTableViewController = segue.destinationViewController as! SoundTableViewController
//            
//            preparePlayer()
//            soundPlayer.play()
//            
//        }
        
//        if segue.identifier == "play" {
//            let alarmTableViewController = segue.destinationViewController as! AlarmTableViewController
//            
//            print("ok")
//            
//            if alarmTableViewController.play == true {
//                preparePlayer()
//                soundPlayer.play()
//                print("called")
//            }
//            
//        }
    }
   
    
}
