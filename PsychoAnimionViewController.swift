//
//  PsychoAnimionViewController.swift
//  PSYKO
//
//  Created by Antonella Cirma on 25/11/2019.
//  Copyright © 2019 prova. All rights reserved.
//

import Foundation
import AVKit
import Speech
import UIKit



class PsychoAnimionViewController: ViewControllerBase{

    var avPlayer: AVAudioPlayer!
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad(){
        super.viewDidLoad()
//        ViewControllerBase.counterPsycho += 1
//        collectionView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        collectionView()
        animateImage()
        
    }
    
    func animateImage(){
        
        collectionView()
        ViewControllerBase.counterPsycho += 1
        UIImageView.animate(withDuration: 1, animations: {
            self.image.transform = CGAffineTransform(scaleX: 5, y: 4)
        }){_ in
            UIImageView.animate(withDuration: 1, animations: {
                self.image.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            }){_ in
                if ViewControllerBase.counterPsycho < 2{
                    self.performSegue(withIdentifier: "NextQuestion", sender: nil)
                }
                else {
                    self.performSegue(withIdentifier: "Tips", sender: nil)
                }
                
            }
        }
    }
    
    
    
    let pianoSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Goofy", ofType: "mp3")!)
      var audioPlayer = AVAudioPlayer()

      func collectionView() {
          do {
               audioPlayer = try AVAudioPlayer(contentsOf: pianoSound)
               audioPlayer.play()
          } catch {
             print ("Could not create audio player.")
          }
      }
    
    
//    func collectionView() {
//
//       let fileName = "Goofy"
//
//        let audioPlayer: AVAudioPlayer?
//        let url = URL(
//            fileURLWithPath: Bundle.main.path(
//                forResource: fileName,
//                ofType: "mp3")!
//        )
//
//        do {
//            try audioPlayer = AVAudioPlayer(contentsOf: url)
//            if let sound = audioPlayer {
//                avPlayer = sound
//                avPlayer.prepareToPlay()
//                avPlayer.play()
//                print("ANDATO mp3")
//            }
//        } catch {
//            print ("Could not create audio player.")
//        }
//
//    }
    
}
