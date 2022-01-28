//
//  videoTutoria.swift
//  navigationworkshop
//
//  Created by Gianluca De Lucia on 21/11/2019.
//  Copyright © 2019 prova. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class videoController: UIViewController {
    
    static var counterVideo = 0

    var player : AVPlayer!
    var playerController : AVPlayerViewController!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        if(videoController.counterVideo1 == 0){
//            videoController.counterVideo1 += 1
//            playVideo()
//            
//            
//            NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name:
//            NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
//            
//           
//            
//        }
//        
//    }
//    
//    @objc func videoDidEnd(notification: NSNotification) {
//           print("video1 ended")
//        text.isHidden = false
//        button.isHidden = false
//    //        let HomeViewController = PlaySceneControllerView(nibName: "PlayScene", bundle: Bundle.main)
//    //        self.present(HomeViewController, animated: true, completion: nil)
//        playerController.dismiss(animated: true)
//        
//        
//            performSegue(withIdentifier: "videoTutorial", sender: nil)
//            
//        }
//
//    private func playVideo() {
//        guard let path = Bundle.main.path(forResource: "TUTORIAL1", ofType:"mp4") else {
//            debugPrint("video.mp4 not found")
//            return
//        }
//        
//    
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        let playerController = AVPlayerViewController()
//        playerController.player = player
////        playerController.showsPlaybackControls = false
//        present(playerController, animated: true) {
//            player.play()
//        }
//    }
//}



//
//  videoTutoria2.swift
//  PSYKO
//
//  Created by Gianluca De Lucia on 22/11/2019.
//  Copyright © 2019 prova. All rights reserved.
//

//

//
//import Foundation
//import UIKit
//import AVKit
//import AVFoundation
//import MediaPlayer
//
//class videoController: UIViewController {
//    static var counterVideo = 0
//    var player : AVPlayer!
//    var playerController : AVPlayerViewController!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
        if( videoController.counterVideo == 0){
                videoController.counterVideo += 1
                playVideo()
      
                NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name:
                NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
                
            }
    }
    
    

    
    @objc func videoDidEnd(notification: NSNotification) {
       print("video1 ended")
//        let HomeViewController = PlaySceneControllerView(nibName: "PlayScene", bundle: Bundle.main)
//        self.present(HomeViewController, animated: true, completion: nil)
        playerController.dismiss(animated: true)
        performSegue(withIdentifier: "videoToPlayScene1", sender: nil)

    }

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "TUTORIAL1", ofType:"mp4") else {
            debugPrint("video.mp4 not found")
            return
        }
        
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController = AVPlayerViewController()
        playerController.player = player
        
       playerController.showsPlaybackControls = false
       
        present(playerController, animated: true) {
            self.player.play()
        }
        
        
        
    }
}
