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
   
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        //layout & display
        self.setTitleColor(MMLightGrayText, for: UIControlState.normal)
        
        self.titleLabel?.font = MMLightFont
        
        self.setDisplayState(display: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    func setSecretKey(secret: String) {
        
        self.secretKey = secret
    }
    
    func toggleState() {
        
        self.setDisplayState(display: !self.displayState)
    }
    
    func setDisplayState(display: Bool) {
        
        self.displayState = display
        
        if(display) {
            
            self.setTitle(self.secretKey, for: UIControlState.normal)
        }
        
        else {
            
            self.setTitle("[Tap to Reveal]", for: UIControlState.normal)
        }
    }

}
