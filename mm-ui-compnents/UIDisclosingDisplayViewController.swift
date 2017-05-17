//
//  UIDisclosingDisplayViewController.swift
//  mm-ui-compnents
//
//  Created by RedLion on 17/05/17.
//  Copyright © 2017 RedLion. All rights reserved.
//

import UIKit

class UIDisclosingDisplayViewController: UIViewController {

    @IBOutlet weak var discloseView: UIDisclosingDisplay!
    @IBOutlet weak var discloseControl: UIButton!
    
    
    @IBOutlet weak var balanceLabel: UIBalanceDisplay!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.balanceLabel.setBalance(balance: 123.8432)
        print(self.balanceLabel.getBalance())
    }
    
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
            frame.size.height += 200.0
            self.discloseView.frame = frame
        })
            
            self.setDisclosure(disclosed: true)
            
        }
        
        else {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                var frame: CGRect = self.discloseView.frame
                frame.size.height -= 200.0
                self.discloseView.frame = frame
            })
            
           self.setDisclosure(disclosed: false)
            
        }
    }
    
    
    
}



 
