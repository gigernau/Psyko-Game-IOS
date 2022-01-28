//
//  ViewControllerBase.swift
//  navigationworkshop
//
//  Created by Samuele Pignoli on 15/11/2019.
//  Copyright © 2019 prova. All rights reserved.
//

import Foundation
import UIKit



class ViewControllerBase : UIViewController {
    let violet = UIColor(displayP3Red: 172/255.0, green: 146/255.0, blue: 235/255.0, alpha: 1)
    let paleBlue = UIColor(displayP3Red: 79/255.0, green: 194/255.0, blue: 232/255.0, alpha: 1)
    let pastelGreen = UIColor(displayP3Red: 160/255.0, green: 213/255.0, blue: 104/255.0, alpha: 1)
    let yellowOchre = UIColor(displayP3Red: 255/255.0, green: 206/255.0, blue: 84/255.0, alpha: 1)
    let fieryRose = UIColor(displayP3Red: 237/255.0, green: 85/255.0, blue: 100/255.0, alpha: 1)
    
    
    static var counter = 0
    static var counterPsycho = 0
    
    
    
    struct Question : Codable {
        var Intimate : [String]
        var nonIntimate : [String]
    }
    
    static var jsonReader: Question!
}


class CircleButton : UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }
    func setup() {
        
//        let dimension = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height)
//        self.frame = dimension
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.2)
        self.layer.cornerRadius = 0.5 * self.bounds.size.height
        
    }
}
