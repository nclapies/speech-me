//
//  ContentView.swift
//  SpeechMe
//
//  Created by Nicolas Clapiès on 2022-07-18.
//

import SwiftUI
import AVFoundation

// text to speech :
// https://developer.apple.com/documentation/avfoundation/speech_synthesis

func speechText(_ text: String) {
    let utterance = AVSpeechUtterance(string: text)

    // Configure the utterance.
    utterance.rate = 0.42
    utterance.pitchMultiplier = 0.8
    utterance.postUtteranceDelay = 0.2
    utterance.volume = 0.8

    // Retrieve a voice.
    let voice = AVSpeechSynthesisVoice(language: "en-CA")

    // Assign the voice to the utterance.
    utterance.voice = voice
    
    // Create a speech synthesizer.
    let synthesizer = AVSpeechSynthesizer()

    // Tell the synthesizer to speak the utterance.
    synthesizer.speak(utterance)
}

struct ContentView: View {
    @State private var text = ""
    var body: some View {
        Text("Type your text and click Speech button")
            .font(.title2)
        TextField(
            "Speech me",
            text: $text
        )
        .padding()
        Button("Speech") {
            speechText(text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
