//
//  TextToSpeech.swift
//  story
//
//  Created by Erennio Iannotta on 28/02/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import AVFoundation

/* synthesizer.speak(utterance!) fa crashare l'app quando viene utilizzato in restartSpeaking() */
class TextToSpeech {
    
    var synthesizer = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance?
    var text, inLanguage: String?
    var atRate: Float?
    
    func toSpeech(text: String, inLanguage: String, atRate: Float) {
        
        self.text = text
        self.inLanguage = inLanguage
        self.atRate = atRate
        
        speech()
    }
    
    func speech() {
        utterance = AVSpeechUtterance(string: self.text!)
        utterance?.voice = AVSpeechSynthesisVoice(language: self.inLanguage)
        utterance?.rate = self.atRate!
        synthesizer.speak(utterance!)
    }
    
    func pauseSpeaking() {
        synthesizer.pauseSpeaking(at: AVSpeechBoundary.word)
    }
    
    func stopSpeaking() {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    func continueSpeaking() {
        synthesizer.continueSpeaking()
    }
    
    func restartSpeaking() {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        speech()
    }
    
    func isSpeaking() -> Bool {
        return synthesizer.isSpeaking
    }
    
}
