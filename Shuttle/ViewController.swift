//
//  ViewController.swift
//  Shuttle
//
//  Created by Greg Hughes on 3/27/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit
import NotificationCenter
class ViewController: UIViewController {
    
    var arrayNoteAndSel : [NoteAndSel] = []
    var cardReader : uniMag?
    var g_readerType = UMREADER_SHUTTLE
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activateReader()
        
        // Do any additional setup after loading the view.
    }
    

    
    
    
    
    @IBAction func swipeButtonTapped(_ sender: Any) {
        swipeCardButtonTapped()
    }
    
    func swipeCardButtonTapped(){
        guard let cardReader = cardReader else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        let ret : UmRet = cardReader.requestSwipe()
        displayCardReaderErrors(message: "Starting read swipe", returnValue: ret)
        print("✴️🆔\(displayCardReaderErrors(message: "Starting read swipe", returnValue: ret))")
        
    }
    
    
    @IBAction func connectButtonTapped(_ sender: Any) {
        connectReader()
    }
    
    func connectReader(){
        guard let cardReader = cardReader else {print("🔥❇️>>>\(#file) \(#line): guard ket failed<<<"); return  }
        let ret : UmRet = cardReader.start(true)
        
        displayCardReaderErrors(message: "Starting Connection", returnValue: ret)
    }
    
    
    
    
    /// in the demo this is called displayUmRet
    func displayCardReaderErrors(message: String, returnValue: UmRet) {
        var s = ""
        
        var label : String = ""
        var label2 = ""
        
        switch (returnValue) {
        case UMRET_SUCCESS          : s = ""; break;
        case UMRET_NO_READER        : s = "No reader attached"; break;
        case UMRET_SDK_BUSY         : s = "Communication with reader in progress"; break;
        case UMRET_MONO_AUDIO       : s = "Mono audio enabled"; break;
        case UMRET_ALREADY_CONNECTED: s = "Already connected"; break;
        case UMRET_LOW_VOLUME       : s = "Low volume"; break;
        case UMRET_NOT_CONNECTED    : s = "Not connected"; break;
        case UMRET_NOT_APPLICABLE   : s = "Not applicable to reader type"; break;
        case UMRET_INVALID_ARG      : s = "Invalid argument"; break;
        case UMRET_UF_INVALID_STR   : s = "Invalid firmware update string"; break;
        case UMRET_UF_NO_FILE       : s = "Firmware file not found"; break;
        case UMRET_UF_INVALID_FILE  : s = "Invalid firmware file"; break;
        default: s="<unknown code>"; break;
        }
        
        label = String(format: "%@ %@\n%@", arguments: [message,(UMRET_SUCCESS == returnValue ? "...":"failed:"), s])
        
        label2 = ""
        }
        
    
    
    
    func registerObservers(_ true: Bool){
        let nc = NSNotification()
        let cd01 = NoteAndSel()
        let cd02 = NoteAndSel()
        
        cd01.setV(setNote: uniMagSwipeNotification, setSelector: #selector(MessageView.waitingForSwipe))
        cd02.setV(setNote: uniMagDidReceiveDataNotification, setSelector: #selector(MessageView.swipeReceived))
        
        arrayNoteAndSel.append(cd01)
        arrayNoteAndSel.append(cd02)
        
        var length = arrayNoteAndSel.count
        
        //write the for in loop no idea what it does..
        
        
    }
    
    
   
    
    
    
    
    
    func activateReader(){
        
        //enable info level NSLogs inside SDK
        // Here we turn on before initializing SDK object so the act of initializing is logged
        uniMag.enableLogging(true)
        
        
        //initialize the SDK by creating a uniMag class object
        cardReader = uniMag()
        
        
        if cardReader == nil {
            print("🔥❇️>>>\(#file) \(#line) ERROR HERE")
        }
        
        
        //Set the reader type. The default is UniMag Pro.
        cardReader?.readerType = g_readerType
        
        
        //set SDK to perform the connect task automatically when headset is attached
        cardReader?.setAutoConnect(true)
        
        
        //set swipe timeout to infinite. By default, swipe task will timeout after 20 seconds
        cardReader?.setSwipeTimeoutDuration(0)
        
        
        //make SDK maximize the volume automatically during connection
        cardReader?.setAutoAdjustVolume(true)
        
        
        //By default, the diagnostic wave file logged by the SDK is stored under the temp directory
        // Here it is set to be under the Documents folder in the app sandbox so the log can be accessed
        // through iTunes file sharing. See UIFileSharingEnabled in iOS doc.
        //[uniReader setWavePath: [NSHomeDirectory() stringByAppendingPathComponent: @"/Documents/audio.wav"]];
        
        #warning("not the same in the demo project vv")
        cardReader?.start(true)
    }
    
    
    
    
    
    
    
    
    
    
    
}
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


