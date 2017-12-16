//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!
    let soundArray = ["note1" , "note2" , "note3" , "note4" , "note5" , "note6" , "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        let selectSoundNameFile: String = soundArray[sender.tag - 1]
        print(selectSoundNameFile)
        playSound(selectSoundNameFile)
        
    }
    
    func playSound(_ note: String) {
        
        let soundURL = Bundle.main.url(forResource: note, withExtension: "wav") // signing the constante to the address where is the file to play the sound
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
  

}

// "do,try,catch" is used when there is a possibility of throw an error, so it "try" to do something and if there is a erros we can deal with it.

// Another option to use those is:
// "try! audioPlayer = AVAudioPlayer(contentsOf: soundURL!)"
// In this case we are 100% sure that we wouldn't have any error, then we do need to catch it.


