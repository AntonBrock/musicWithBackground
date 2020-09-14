//
//  ViewController.swift
//  BackgroundTest
//
//  Created by Admin on 14.09.2020.
//  Copyright © 2020 Anton Dobrynin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playingSoundWith(fileName: "testSong")
    }
    
    func playingSoundWith(fileName: String) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: Bundle.main.url(forResource: fileName, withExtension: "mp3")!)
            audioPlayer.prepareToPlay()
         
         var audioSession = AVAudioSession.sharedInstance()
         do {
             try audioSession.setCategory(AVAudioSession.Category.playback)
         } catch {
             
         }
         
        } catch {
            print(error)
        }
    }

    @IBAction func play(_ sender: UIButton) {
      audioPlayer.play()
    }
    
    @IBAction func stop(_ sender: UIButton) {
      audioPlayer.stop()
    }
    
}

