//
//  NoteAndSel.swift
//  Shuttle
//
//  Created by Greg Hughes on 3/27/19.
//  Copyright © 2019 Greg Hughes. All rights reserved.
//

import UIKit




class NoteAndSel : NSObject{
    
    var note : String = ""
    var selector : Selector?
    
    func setV(setNote: String, setSelector: Selector){
        self.note = setNote
        self.selector = setSelector
    }
}
