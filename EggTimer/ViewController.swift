//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    override func viewDidLoad() {super.viewDidLoad()}
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UIProgressView!
    
    let hardnessTime = ["Soft": (5),"Medium": 7,"Hard": 12]
    var timer: Timer?
    var TotalSeconds = 0
    var SecondsPassed = 0
    
    @IBAction func hardenssSelected(_ sender: UIButton) 
    {
        let hardness = sender.currentTitle!
        var time = 0
        SecondsPassed = 0
        progressLabel.progress = 0.0
        titleLabel.text = hardness
        
        switch hardness 
        {
            case "Soft":
                time = hardnessTime["Soft"]!
                startCountdown(time)
                
            case "Medium":
                time = hardnessTime["Medium"]!
                startCountdown(time)
                
            case "Hard":
                time = hardnessTime["Hard"]!
                startCountdown(time)
                
            default:
                print("Error")
        }
    }
    
    func startCountdown(_ seconds: Int)
    {
        // Invalidate previous timer if exists
        timer?.invalidate()
        
        // Initialize the countdownSeconds
        TotalSeconds = seconds
        
        // Initialize and start a new timer
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
           
    @objc func updateCountdown() 
    {
        if SecondsPassed < TotalSeconds
        {
            SecondsPassed += 1
            progressLabel.progress += Float(1) / Float(TotalSeconds)
            print(TotalSeconds, SecondsPassed)
        }
        else
        {
            // Countdown has finished, invalidate timer
            timer?.invalidate()
            // You can perform any action here when the countdown finishes
            titleLabel.text = "Countdown Finished!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String)
    {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
