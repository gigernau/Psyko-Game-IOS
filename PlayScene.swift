//
//  Settins.swift
//  navigationworkshop
//
//  Created by Samuele Pignoli on 15/11/2019.
//  Copyright © 2019 prova. All rights reserved.
//

import Foundation
import UIKit
import Speech
import AVKit

class PlaySceneControllerView : ViewControllerBase, SFSpeechRecognizerDelegate {
//  bottoni
    
        
    
    @IBOutlet weak var PauseView: UIView!
    @IBOutlet weak var GameCard: UILabel!
//  speech recognition
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-EN"))!
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    

        static var questionToOutput = ViewControllerBase.jsonReader

    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoController.counterVideo = 0
        videoController2.counterVideo2 = 0
        ViewControllerBase.counter += 1
        let upSwpie = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        
        GameCard.layer.masksToBounds = true
        GameCard.layer.cornerRadius = 15
//        GameCard.layer.borderColor = UIColor.black.cgColor
//        GameCard.layer.borderWidth = 1.0
        GameCard.addGestureRecognizer(upSwpie)
        view.addGestureRecognizer(upSwpie)
//        self.view.backgroundColor = fieryRose
       
        
        PauseView.isHidden = true
        PauseView.layer.cornerRadius = 20
        upSwpie.direction = .up
       
        speechRecognizer.delegate = self
          
          SFSpeechRecognizer.requestAuthorization { (authStatus) in
              
              var isButtonEnabled = false
              
              switch authStatus {
              case .authorized:
                  isButtonEnabled = true
                  
              case .denied:
                  isButtonEnabled = false
                  print("User denied access to speech recognition")
                  
              case .restricted:
                  isButtonEnabled = false
                  print("Speech recognition restricted on this device")
                  
              case .notDetermined:
                  isButtonEnabled = false
                  print("Speech recognition not yet authorized")
              @unknown default:
                fatalError()
                
            }
              
            
        }
        
        startRecording()
    }
   
    
    
    override func viewWillAppear(_ animated: Bool) {
     
        super.viewWillAppear(animated)
//        GameCard.text = questions[ViewControllerBase.counter % questions.count]
        randomizeQuestions()
        
    }
  
//  funzioni richiamenti buttons
    @IBAction func changeScreenButton(_ sender: Any) {
        
   }
    @IBAction func PauseButton(_ sender: Any) {
        PauseView.isHidden = false
    }
// funzioni gesture
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer){
        if (sender.state == .ended){
           performSegue(withIdentifier: "NextQuestion", sender: nil)
        
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
     performSegue(withIdentifier: "NextQuestion", sender: nil)
    }
    
    
    
    
   

//    funzioni speech to text
    
        func startRecording() {
            var textRis: String?
            if recognitionTask != nil {  //1
                recognitionTask?.cancel()
                recognitionTask = nil
            }
            
            let audioSession = AVAudioSession.sharedInstance()  //2
            do {
                try audioSession.setCategory(AVAudioSession.Category.record)
                try audioSession.setMode(AVAudioSession.Mode.measurement)
                try audioSession.setActive(true)
            } catch {
                print("audioSession properties weren't set because of an error.")
            }
            
            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()  //3
            
            let inputNode = audioEngine.inputNode
            
            guard let recognitionRequest = recognitionRequest else {
                fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
            } //5
            
            recognitionRequest.shouldReportPartialResults = true  //6
            
            recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in  //7
                
                var isFinal = false  //8
                
                if result != nil {
                    
                    textRis = result?.bestTranscription.formattedString  //9
                    isFinal = (result?.isFinal)!
                    print(textRis!)
                    // textRis = Stringa speech to text
                    if textRis!.contains("Psycho") || textRis!.contains("psycho"){
                        print("TIPS")
                        self.performSegue(withIdentifier: "Psychosegue", sender: nil)
                    }
                }
                
                if error != nil || isFinal {  //10
                    self.audioEngine.stop()
                    inputNode.removeTap(onBus: 0)
                    
                    self.recognitionRequest = nil
                    self.recognitionTask = nil
                    
                }
            })
            
            let recordingFormat = inputNode.outputFormat(forBus: 0)  //11
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
                self.recognitionRequest?.append(buffer)
            }
            
            audioEngine.prepare()  //12
            
            do {
                try audioEngine.start()
                
            } catch {
                print("audioEngine couldn't start because of an error.")
            }
            
          
            
        }
    
    func copyQuestions(_QuestionsStruct: Question) ->Question {
        let copied : Question = _QuestionsStruct
        return copied
    }
    
    
    func randomizeQuestions() {
        
        if (PlaySceneControllerView.questionToOutput!.Intimate.count != 0 && PlaySceneControllerView.questionToOutput!.nonIntimate.count != 0) {
            if(ViewControllerBase.counter < 15 ){
                let randomN = Int.random(in: 0 ..< (PlaySceneControllerView.questionToOutput!.nonIntimate.count))
                GameCard.text = PlaySceneControllerView.questionToOutput!.nonIntimate.remove(at: randomN)
                print("Domande nell'array: \(PlaySceneControllerView.questionToOutput!.nonIntimate.count)")
                print(PlaySceneControllerView.questionToOutput!.nonIntimate)
            }else{
                let randomN = Int.random(in: 0 ..< (PlaySceneControllerView.questionToOutput!.Intimate.count))
                GameCard.text = PlaySceneControllerView.questionToOutput!.Intimate.remove(at: randomN)
            
            }
        }
        else {
            print("Ricarincando gli array!!!!!!!!")
            PlaySceneControllerView.questionToOutput = copyQuestions(_QuestionsStruct: ViewControllerBase.jsonReader)
            randomizeQuestions()
        }
    }
}
