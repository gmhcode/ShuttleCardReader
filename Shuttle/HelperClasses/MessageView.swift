//
//  MessageView.swift
//  Shuttle
//
//  Created by Greg Hughes on 3/27/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit
class MessageView{
    
    class func show(_ message:String) {
        
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let vc = UIViewController()
        let okButton = UIAlertAction(title: "OK", style: .default) { (_) in
            
        }
        alertController.addAction(okButton)
        
        vc.present(alertController,animated: true, completion: nil)
        alertController.show()
        //        let alert = UIAlertView(title:"", message: message, delegate:nil, cancelButtonTitle:nil, otherButtonTitles: "OK")
        //        alert.show()
    }
    
    @objc func waitingForSwipe(){
        let alertController = UIAlertController(title: "Swipe Card", message: "Waiting for card swipe", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (success) in
        }
        
        alertController.addAction(cancelAction)
        alertController.show()
    }
    
    
    @objc func swipeReceived(){
        
        let alert = UIViewController()
        alert.dismiss(animated: true, completion: nil)
        
        let alertController = UIAlertController(title: "Swipe Received", message: "Thanks", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "ok", style: .default) { (success) in
        }
        
        alertController.addAction(okButton)
        alertController.show()
        
    }
    
    
    
    
}
