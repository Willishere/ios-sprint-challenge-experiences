//
//  Recorder.swift
//  Experiences
//
//  Created by William Chen on 11/1/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import AVFoundation

class Recorder: AVAudioPlayerDelegate{
    var recorder: AVAudioRecorder?
    var recordedURL: URL?
    var id: String?
  
    var isRecording: Bool {
        return recorder?.isRecording ?? false
    }
    
    func saveRecordedAudio() -> URL? {
        let fileManager = FileManager.default
        let documentsDirectory = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        return documentsDirectory.appendingPathComponent(id ?? "").appendingPathExtension("caf")
        
    }
    
    func record(){
        guard !isRecording else {
            recorder?.stop()
            return
        }
        
        do {
            let audioFormat = AVAudioFormat(standardFormatWithSampleRate: 44100.0, channels: 2)!
            recorder = try AVAudioRecorder(url: saveRecordedAudio()!, format: audioFormat)
        } catch  {
            NSLog("Unable to start recording: \(error)")
        }
    }
    
    func audioRecorderDiDFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool){
        
        
        recordingURL = recorder.url
        self.recorder = nil
    }
    
}
