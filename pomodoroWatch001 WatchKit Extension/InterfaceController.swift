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
    
    @IBAction func buttonPressed() {
        if isWorking {
            label001.setText("pressed ")
            isWorking = false
            button.setTitle("Start")
            setImageViewWithImage(named: "blackTomato")
        } else {
            label001.setText("unpressed ")

            isWorking = true
            setImageViewWithImage(named: "redTomato")
            button.setTitle("Stop")
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        setImageViewWithImage(named: "blackTomato")
    }
    
    func setImageViewWithImage(named inputName: String) {
        let image = UIImage.init(named: inputName)
        if let image = image {
            imageView.setImage(image)
        } else {
            print("could not set image")
        }
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
