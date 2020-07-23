//
//  ViewController.swift
//  App Kara
//
//  Created by Zachary Zak on 11/14/19.
//  Copyright © 2019 Zachary Zak. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var al = AppLogic()
    var player: AVAudioPlayer?
    
    @IBOutlet weak var segmentSelector: UISegmentedControl!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var shuffleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        let selected = sender.selectedSegmentIndex
        mainLabel.text = sender.titleForSegment(at: selected)
        al.setSegment(selectedSegment: selected)
    }
    
    @IBAction func shufflePressed(_ sender: UIButton) {
        al.randomize()
        updateUI()
        playSound(soundName: al.getSound())
    }
    
    func updateUI() {
        mainLabel.text = al.getLabelText()
        mainLabel.textColor = al.getColor()
        shuffleButton.backgroundColor = al.getColor()
    }
    
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}

