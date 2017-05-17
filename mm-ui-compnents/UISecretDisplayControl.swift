//
//  UISecretDisplayControl.swift
//  mm-ui-compnents
//
//  Created by RedLion on 18/05/17.
//  Copyright © 2017 RedLion. All rights reserved.
//

import UIKit

class UISecretDisplayControl: UIButton {

    
    var displayState: Bool = false
    var secretKey: String = "INITSECRETKEY"
   
    
    override func awakeFromNib() {
        
        
    }
    
    func setSecretKey(secret: String) {
        
        self.secretKey = secret
    }
    
    func toggleState() {
        
        self.setDisplasyState(display: !self.displayState)
    }
    
    func setDisplasyState(display: Bool) {
        
        self.displayState = display
        
        if(display) {
            
            self.setTitle(self.secretKey, for: UIControlState.normal)
        }
        
        else {
            
            self.setTitle("[Tap to Reveal]", for: UIControlState.normal)
        }
    }

}
