//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Joshua Vargas on 10/4/16.
//  Copyright © 2016 iOSDevTraining. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var audioRecorder : AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(_ sender: AnyObject) {
        
        print("Record button was pressed.")
        recordingLabel.text = "Recording in progress."
        stopRecordingButton.isEnabled = true
        recordButton.isEnabled = false
    
    }
    
    @IBAction func stopRecording(_ sender: AnyObject) {
        print("Recording was stopped.")
        recordingLabel.text = "Recording was stopped."
        recordButton.isEnabled = true
        stopRecordingButton.isEnabled = false
        audioRecorder.stop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        stopRecordingButton.isEnabled = false
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Audio recording finished")
        
        if(flag){
            self.performSegue(withIdentifier: "Stop recording", sender: audioRecorder.url)
        } else{
            print("Recording failed")
        }
    }
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    
    
}

