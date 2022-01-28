

//
//  TipsViewController.swift
//  PSYKO
//
//  Created by Gianluca De Lucia on 25/11/2019.
//  Copyright © 2019 prova. All rights reserved.
//

import Foundation
import Speech
import AVKit
import UIKit



class TipsViewController: ViewControllerBase{
    @IBOutlet weak var Tip1: UIButton!
    @IBOutlet weak var Tip2: UIButton!
    @IBOutlet weak var Tip3: UIButton!
    @IBOutlet weak var Tip4: UIButton!
    @IBOutlet weak var Tip5: UIButton!
    @IBOutlet weak var Tip6: UIButton!
    @IBOutlet weak var Tip7: UIButton!
    @IBOutlet weak var Tip8: UIButton!
    @IBOutlet weak var Tip9: UIButton!
    @IBOutlet weak var Tip10: UIButton!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        enableButtons(counter: ViewControllerBase.counterPsycho)
        
    }
    
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        switch sender {
        case Tip1 : tipLabel.text = "They all shouted \"PSYKO!\", Try to understand on what occasion it happens!"

        case Tip2 : tipLabel.text = "Before changing the question, you can try asking the same person for more details about his answer, until a PSYKO comes out!"
        case Tip3 : tipLabel.text = "Have you noticed that there is always a player who starts shouting PSYKO first?"
        case Tip4 : tipLabel.text = "All players do their utmost to be honest ..."
        case Tip5 : tipLabel.text = "... but do you think their answers fit them?"
        case Tip6 : tipLabel.text = "When you read the question, do it to someone you think you know the answer she would give."
        case Tip7 : tipLabel.text = "Sometimes someone - is not able to - give correct information."
        case Tip8 : tipLabel.text = "If you don't get to the top, try asking the same question to more players before changing it! Do you notice anything?"

        case Tip9 : tipLabel.text = "The players you ask the questions don't know the correct answer exactly, but try to get there intuitively."
        case Tip10 : tipLabel.text = "But someone else, on the other hand, knows exactly the answer to the questions you ask, and it is he who starts the PSYKO, when it happens!"
            
        default:
            tipLabel.text = "Error"
        }
    }
    func enableButtons(counter : Int) {
        if counter >= 2 {
            Tip1.isEnabled = true
            tipLabel.text = "They all shouted \"PSYKO!\", Try to understand on what occasion it happens!"

        }
        if counter >= 4 {
            Tip2.isEnabled = true
            tipLabel.text = "Before changing the question, you can try asking the same person for more details about his answer, until a PSYKO comes out!"
        }
        if counter >= 6 {
            Tip3.isEnabled = true
            tipLabel.text = "Have you noticed that there is always a player who starts shouting PSYKO first?"
        }
        if counter >= 8 {
            Tip4.isEnabled = true
            tipLabel.text = "All players do their utmost to be honest ..."
        }
        if counter >= 10 {
            Tip5.isEnabled = true
            tipLabel.text = "... but do you think their answers fit them?"

        }
        if counter >= 12 {
            Tip6.isEnabled = true
            tipLabel.text = "When you read the question, do it to someone you think you know the answer she would give."
        }
        if counter >= 14 {
            Tip7.isEnabled = true
            tipLabel.text = "Sometimes someone - is not able to - give correct information."
        }
        if counter >= 16 {
            Tip8.isEnabled = true
            tipLabel.text = "If you don't get to the top, try asking the same question to more players before changing it! Do you notice anything?"
        }
        if counter >= 18 {
            Tip9.isEnabled = true
            tipLabel.text = "The players you ask the questions don't know the correct answer exactly, but try to get there intuitively."
        }
        if counter >= 20 {
            Tip10.isEnabled = true
            tipLabel.text = "But someone else, on the other hand, knows exactly the answer to the questions you ask, and it is he who starts the PSYKO, when it happens!"
        }
    }
    
    
}



