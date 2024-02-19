//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countdownLabel: UILabel!

    let hardnessTime = ["Soft": (5*60),"Medium": 7*60,"Hard": 12*60]
    var timer: Timer?
    var countdownSeconds = 0
    
    @IBAction func hardenssSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        var time = 0
        switch hardness {
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
        func startCountdown(_ seconds: Int) {
               // Invalidate previous timer if exists
               timer?.invalidate()
               
               // Initialize the countdownSeconds
               countdownSeconds = seconds
               
               // Update the label with initial countdown value
               countdownLabel.text = "\(countdownSeconds)"
               
               // Initialize and start a new timer
               timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
           }
           
           @objc func updateCountdown() {
               if countdownSeconds > 0 {
                   countdownSeconds -= 1
                   countdownLabel.text = "\(countdownSeconds)"
               } else {
                   // Countdown has finished, invalidate timer
                   timer?.invalidate()
                   // You can perform any action here when the countdown finishes
                   countdownLabel.text = "Countdown Finished!"
               }
           }
}
