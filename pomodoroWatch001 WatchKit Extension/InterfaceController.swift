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
    
    @IBOutlet var timeLabel: WKInterfaceTimer!
    @IBOutlet var button: WKInterfaceButton!
    
    var isWorking = false
    
    @IBAction func buttonPressed() {
        if isWorking {
            isWorking = false
            button.setTitle("Start")
        } else {
            isWorking = true
            button.setTitle("Stop")
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
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
