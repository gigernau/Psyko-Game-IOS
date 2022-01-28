//
//  videoTutoria2.swift
//  PSYKO
//
//  Created by Gianluca De Lucia on 22/11/2019.
//  Copyright © 2019 prova. All rights reserved.
//

//


import Foundation
import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class videoController2: UIViewController {
    static var counterVideo2 = 0
    var player : AVPlayer!
    var playerController : AVPlayerViewController!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
        if( videoController2.counterVideo2 == 0){
                videoController2.counterVideo2 += 1
                playVideo()
      
                NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name:
                NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
                
            }
    }
    
    

    
    @objc func videoDidEnd(notification: NSNotification) {
       print("video ended")
//        let HomeViewController = PlaySceneControllerView(nibName: "PlayScene", bundle: Bundle.main)
//        self.present(HomeViewController, animated: true, completion: nil)
        playerController.dismiss(animated: true)
        performSegue(withIdentifier: "videoToPlayScene", sender: nil)
        
    }

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "TUTORIAL2", ofType:"mp4") else {
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
