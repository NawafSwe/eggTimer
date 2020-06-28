//
//  ViewController.swift
//  EggTimer
//
//  Created by Nawaf Al sharqi
//  Copyright © 2020
//

import UIKit

class ViewController: UIViewController {
    
    // minutesConversion * eggTimes[key] to convert them to second to use them in the counter
    var counter : Int = 0
    var timer  = Timer()
    let minutesConversion : Int = 60
    // we have to use lazy to avoid Cannot use instance member 'counter' within property initializer; property initializers run before 'self' is available this error
    lazy var eggTimes: [String:Int] = ["Soft":  5, "Medium": 7 * minutesConversion,"Hard":  12 * minutesConversion]
    
    
    //UI vars
    @IBOutlet weak var eggStatus: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
    @IBAction func hardnessSelected(_ sender:UIButton){
        // when we but ! at the end we tells that we are sure there must be a value
        let hardness : String =  sender.currentTitle!
        counter = eggTimes[hardness]!
        
        //timer.invalidate will stop the timer like cancel it if the user change his mind and pressed another egg
        timer.invalidate()
        
        //after clicking we want to count
        // a way to create a counter
        //timeInterval is number of seconds
        // #selector you pass to it a function to repeat ex, we want to modify our progress bar in the UI based in the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    //@objc from objective c
    @objc func updateCounter() {
        //example functionality
        if counter > 0{
            print("\(counter) seconds")
            counter -= 1
        }else{
            //stop the timer and change the label 
            timer.invalidate()
             eggStatus.text = "YOUR EGG IS DONE!"
        }
    }
    }


