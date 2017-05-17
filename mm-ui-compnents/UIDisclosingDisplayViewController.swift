//
//  UIDisclosingDisplayViewController.swift
//  mm-ui-compnents
//
//  Created by RedLion on 17/05/17.
//  Copyright © 2017 RedLion. All rights reserved.
//

import UIKit

class UIDisclosingDisplayViewController: UIViewController {
    
    @IBOutlet weak var balanceLabel: UIBalanceDisplay!

    //discloseView
    @IBOutlet weak var discloseView: UIDisclosingDisplay!
    @IBOutlet weak var discloseControl: UIButton!
    
    //subviews of discloseView
    @IBOutlet weak var disclosingDisplayAddress: UILabel!
    
    @IBOutlet weak var secretViewKeyControl: UISecretDisplayControl!
    
    @IBOutlet weak var secretSpendKeyControl: UISecretDisplayControl!
    @IBAction func secretDisplayControlToggled(_ sender: UISecretDisplayControl) {
        
        
        sender.toggleState()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for testing
        self.balanceLabel.setBalance(balance: 123.8432)
        print(self.balanceLabel.getBalance())
        self.setAddress(address: "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234")
        self.setSecretViewKey(secretViewKey: "012345678901234567890123456789012345678")
        self.setSecretSpendKey(secretSpendKey: "012345678901234567890123456789012345678")
    }
    
    
    
    //accessors
    func setAddress (address: String) {
        
        self.disclosingDisplayAddress.text = address
    }
    func setSecretViewKey (secretViewKey: String) {
        
        self.secretViewKeyControl.setSecretKey(secret: secretViewKey)
    }
    func setSecretSpendKey (secretSpendKey: String) {
        
        self.secretSpendKeyControl.setSecretKey(secret: secretSpendKey)
    }
    
    
    //controls
    func setDisclosure( disclosed: Bool ) { /*set the disclosed state, and change the image as appropriate
                manually set instead of using button UIControlState to allow adequate customization */
        
        if (disclosed) {
            
            self.discloseControl.setTitle("v", for: UIControlState.normal)
        }
        
        else {
            
            self.discloseControl.setTitle(">", for: UIControlState.normal)
        }
        
        self.discloseView.disclosed = disclosed
    }
    
    @IBAction func discloseActivated(_ sender: Any) {
       
        if (!self.discloseView.disclosed) {
            
        UIView.animate(withDuration: 0.2, animations: {
            
            var frame: CGRect = self.discloseView.frame
            frame.size.height += 350.0
            self.discloseView.frame = frame
        })
            
            self.setDisclosure(disclosed: true)
            
        }
        
        else {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                var frame: CGRect = self.discloseView.frame
                frame.size.height -= 350.0
                self.discloseView.frame = frame
            })
            
           self.setDisclosure(disclosed: false)
        }
    }
    
    
    
}



 
