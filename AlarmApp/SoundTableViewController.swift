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
        self.tableView?.backgroundColor = UIColor.whiteColor()
    }
    
    
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
    
    @IBAction func unwindToAlarmTableViewController(segue: UIStoryboardSegue) {
        
    }
    
    
    /*@IBOutlet weak var btnRecord: UIButton!
    
    @IBOutlet weak var btnPlay: UIButton!
    
    var audioRecorder : AVAudioRecorder!
    var audioPlayer : AVAudioPlayer!
    
    let isRecorderAudioFile = false
    let recordSettings = [AVSampleRateKey : NSNumber(float: Float(44100.0)),AVFormatIDKey : NSNumber(int: Int32(kAudioFormatMPEG4AAC)),AVNumberOfChannelsKey : NSNumber(int: 1),
                          AVEncoderAudioQualityKey : NSNumber(int: Int32(AVAudioQuality.Medium.rawValue))]
    
    func directoryURL() -> NSURL? {
        let fileManager = NSFileManager.defaultManager()
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = urls[0] as NSURL
        let soundURL = documentDirectory.URLByAppendingPathComponent("sound.m4a")
        print(soundURL)
        return soundURL
    }
    
    
    @IBAction func doRecording(sender: AnyObject) {
        if sender.titleLabel!!.text == "Record" {
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                try audioRecorder = AVAudioRecorder(URL: self.directoryURL()!,
                                                    settings: recordSettings)
                audioRecorder.prepareToRecord()
            } catch {
            }
            do {
                self.btnRecord.setTitle("Stop", forState: UIControlState.Normal)
                self.btnPlay.enabled = false
                try audioSession.setActive(true)
                audioRecorder.record()
            } catch {
            }
        }else{
            audioRecorder?.stop()
            let audioSession = AVAudioSession.sharedInstance()
            do {
                self.btnRecord?.setTitle("Record", forState: UIControlState.Normal)
                self.btnPlay.enabled = true
                try audioSession.setActive(false)
            } catch {
            }
        }
    }
    
    
    @IBAction func doPlay(sender: AnyObject) {
        if !audioRecorder.recording {
            self.audioPlayer = try! AVAudioPlayer(contentsOfURL: audioRecorder.url)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.delegate = self.audioPlayer.delegate
            self.audioPlayer.play()
        }
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print(flag)
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        print(flag)
    }
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer, error: NSError?){
        print(error.debugDescription)
    }
    internal func audioPlayerBeginInterruption(player: AVAudioPlayer){
        print(player.debugDescription)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        //self.btnPlay.enabled = false
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/                                                                                                                                               
    
}


