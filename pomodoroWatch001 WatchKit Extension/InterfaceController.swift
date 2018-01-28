//
//  InterfaceController.swift
//  pomodoroWatch001 WatchKit Extension
//
//  Created by David on 1/27/18.
//  Copyright © 2018 Vision Runner. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var button: WKInterfaceButton!
    @IBOutlet var imageView: WKInterfaceImage!
    @IBOutlet var label001: WKInterfaceLabel!
    
    var image = UIImage()
    var isWorking = false
    var RESTING_MINUTES = 5
    var WORKING_MINUTES = 25
    var SECONDS_IN_MINUTES = 60
    var timer: Timer = Timer()
    var secondsLeftInCurrentCount = 0
    
    @IBAction func buttonPressed() {
        if isWorking {
            timer.invalidate()
            button.setTitle("Start")
            setLabel(withString: "press start")
            setImageViewWithImage(named: "blackTomato")
            isWorking = false
        } else {
            timer.invalidate()
            button.setTitle("Stop")
            setLabel(withString: "working...")
            setImageViewWithImage(named: "redTomato")
            let inputTime: Int = WORKING_MINUTES * SECONDS_IN_MINUTES
            startTimer(withSeconds: inputTime)
            isWorking = true
        }
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func setLabel(withString inputString: String) {
        label001.setText(inputString)
    }
    
    func startTimer(withSeconds inputSeconds: Int) {
        secondsLeftInCurrentCount = inputSeconds
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        
        if secondsLeftInCurrentCount >= 1 {
            secondsLeftInCurrentCount = secondsLeftInCurrentCount - 1
            let hoursMinutesSeconds: (Int,Int,Int) = secondsToHoursMinutesSeconds(seconds: secondsLeftInCurrentCount)
            let hours = String(format: "%02d", hoursMinutesSeconds.0)
            let minutes = String(format: "%02d", hoursMinutesSeconds.1)
            let seconds = String(format: "%02d", hoursMinutesSeconds.2)
            setLabel(withString: "\(hours):\(minutes):\(seconds)")
        } else {
            
            //TODO: Make the watch haptic feedback at you
            // One tap to start working
            // Two taps when you've finished
            // One soft tap when you stop
            
            if isWorking {
                isWorking = false
                label001.setText("resting...")
                timer.invalidate()
                startTimer(withSeconds: RESTING_MINUTES * SECONDS_IN_MINUTES)
                setImageViewWithImage(named: "greenTomato")
            } else {
                isWorking = true
                label001.setText("working...")
                timer.invalidate()
                startTimer(withSeconds: WORKING_MINUTES * SECONDS_IN_MINUTES)
                setImageViewWithImage(named: "redTomato")
            }
        }
    }
    
    func setImageViewWithImage(named inputName: String) {
        let image = UIImage.init(named: inputName)
        if let image = image {
            imageView.setImage(image)
        } else {
            print("could not set image")
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        setImageViewWithImage(named: "blackTomato")
    }
    

    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
