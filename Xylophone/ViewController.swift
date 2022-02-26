//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation




class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
        override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func keyPressed(_ sender: UIButton) {
       
        playNote(title: sender.currentTitle?.uppercased() ?? "D")
        
       
    }
    
    func animateButton(sender: UIButton){
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            sender.alpha = 0.5
        }
    }
    
    func playNote(title: String){
        
        
        
        let url = Bundle.main.url(forResource: title, withExtension: "wav")!

            do {
                player = try AVAudioPlayer(contentsOf: url)
                guard let player = player else { return }

                player.prepareToPlay()
                player.play()

            } catch let error as NSError {
                print(error.description)
            }
        print(title)
    }

}

