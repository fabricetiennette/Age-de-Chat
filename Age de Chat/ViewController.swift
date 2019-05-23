//
//  ViewController.swift
//  Age de Chat
//
//  Created by Fabrice Etiennette on 22/05/2019.
//  Copyright © 2019 Fabrice Etiennette. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculerAction(_ sender: Any) {
        // code pour le bouton
        view.endEditing(true)
        
        //verifier que le placeholder
        if ageTextField.text != nil {
            let texte = ageTextField.text!
            if let nombreEntier = Int(texte){
                let ageDeChat = nombreEntier * 7
                resultLabel.text = "Votre âge de chat est de : \(ageDeChat) ans!"
            }
        }
    }
    
    @IBAction func soundAction(_ sender: Any) {
        // play result
        if let texte = resultLabel.text {
                let speech = AVSpeechSynthesizer()
                let utterance = AVSpeechUtterance(string: texte)
                utterance.rate = 0.5
                utterance.voice = AVSpeechSynthesisVoice(language: "fr-FR")
                speech.speak(utterance)
            
            // Play even if iphone is on silent mode
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                //print("AVAudioSession Category Playback OK")
                do {
                    try AVAudioSession.sharedInstance().setActive(true)
                    //print("AVAudioSession is Active")
                } catch _ as NSError {
                    //print(error.localizedDescription)
                }
            } catch _ as NSError {
                //print(error.localizedDescription)
            }
        }
    }
}

