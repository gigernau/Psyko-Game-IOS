//
//  MainScene.swift
//  navigationworkshop
//
//  Created by Samuele Pignoli on 15/11/2019.
//  Copyright © 2019 prova. All rights reserved.
//

import Foundation
import UIKit
class mainScreenControllerView : ViewControllerBase {
    
      
        override func viewDidLoad() {
            super.viewDidLoad()
//            self.view.backgroundColor = yellowOchre
            JsonConversion()
        }
        // Json parsing
          
          
          
          let  documentDirectory : URL = Bundle.main.bundleURL
          func JsonConversion()
          {
              let jsonFilePath = documentDirectory.appendingPathComponent("Questions.json")
              do {
                  let data = try Data(contentsOf: jsonFilePath, options: .mappedIfSafe)
                  let decoder = JSONDecoder.init()
                  print ("Decoder created")
                ViewControllerBase.jsonReader = try decoder.decode(Question.self, from: data)
                  print ("Decoded")
    //              print (jsonReader!.Intimate[1])
                  
              }
              catch {
                  print ("addioTensing")
              }
          }
}
