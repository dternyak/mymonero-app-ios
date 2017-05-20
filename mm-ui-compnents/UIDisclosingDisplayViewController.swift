//
//  UIDisclosingDisplayViewController.swift
//  mm-ui-compnents
//
//  Created by RedLion on 17/05/17.
//  Copyright © 2017 RedLion. All rights reserved.
//

import UIKit

class UIDisclosingDisplayViewController: UIViewController {
    
    //
    var balanceDisplay: UIBalanceDisplay!
    var discloseDisplay: UIDisclosingDisplay!
    //
    
    //@IBOutlet weak var balanceLabel: UIBalanceDisplay!

    //discloseView
    //@IBOutlet weak var discloseView: UIDisclosingDisplay!
    //@IBOutlet weak var discloseControl: UIButton!
    
    //subviews of discloseView
    //@IBOutlet weak var addressPreviewLabel: UILabel!
    
    
    //@IBOutlet weak var disclosingDisplayAddress: UILabel!
    
    //@IBOutlet weak var secretViewKeyControl: UISecretDisplayControl!
    
    //@IBOutlet weak var secretSpendKeyControl: UISecretDisplayControl!
    @IBAction func secretDisplayControlToggled(_ sender: UISecretDisplayControl) {
        
        
        sender.toggleState()
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.layout()
        
        print(self.discloseDisplay)
        self.discloseDisplay.addressLabel.textColor = MMLightGrayText
        //self.discloseDisplay.addressLabel.text = "TEST"
        self.setAddress(address: "TESTADDRESS")
        self.balanceDisplay.setBalance(balance: 111.999)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func layout() {
        
        let containerView: UIView = self.constructContainer()
        
        self.constructBalanceDisplay(superview: containerView)
        self.constructDiscloseDisplay(superview: containerView)
    }
    
    func constructContainer() -> UIView {
        
        let r: CGRect = UIScreen.main.bounds
        let w: CGFloat = r.width
        let h: CGFloat = r.height
        
        
        //create padded container for subviews
        let borderContainer_r: CGRect = CGRect(x: r.origin.x,
                                               y: r.origin.y,
                                               width: r.width - (r.width * 0.1),
                                               height: r.height - (r.height * 0.2))
        
        let borderContainer: UIView = UIView(frame: borderContainer_r)
        borderContainer.center = CGPoint(x: w/2, y: h/2) //center in screen
        
        borderContainer.backgroundColor = UIColor.clear
        
        self.view.addSubview(borderContainer)
        
        return borderContainer
    }
    
    func constructBalanceDisplay(superview: UIView) {
        
        let balanceDisplay_r: CGRect = CGRect (x: 0, y: 0, width: superview.bounds.width * 1.0, height: 100.0)
        self.balanceDisplay = UIBalanceDisplay(frame: balanceDisplay_r)
        balanceDisplay.center = CGPoint(x: superview.bounds.width/2, y: balanceDisplay.bounds.height/2)
        
        //b.backgroundColor = UIColor.red
        
        superview.addSubview(balanceDisplay)
    }
    
    func constructDiscloseDisplay(superview: UIView) {
        
         self.discloseDisplay = UIDisclosingDisplay(frame: CGRect(
            x: 0.0,
            y: 110.0,
            width: superview.bounds.width,
            height: 400.0))
        
        self.discloseDisplay.backgroundColor = UIColor.red
        
        superview.addSubview(self.discloseDisplay)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //layout
        self.view.backgroundColor = MMDarkGray
        
        //self.discloseDisplay.addressLabel.textColor = MMLightGrayText
        //self.addressPreviewLabel.textColor = MMLightGrayText
        //self.disclosingDisplayAddress.textColor = MMLightGrayText
        
        //self.disclosingDisplayAddress.font = MMStandardFont
        
        //for testing
        //self.balanceLabel.setBalance(balance: CGFloat(1234.567890001))
        //print(self.balanceLabel.getBalance())
        ///self.setAddress(address: "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234")
        //self.setSecretViewKey(secretViewKey: "012345678901234567890123456789012345678")
        //self.setSecretSpendKey(secretSpendKey: "012345678901234567890123456789012345678")
        
        //
        
        //self.layout()
    }
    
    
    
    //accessors
    func setAddress (address: String) {
        
        //self.addressPreviewLabel.text = address
        
        //self.disclosingDisplayAddress.text = address
        //print(self.discloseDisplay.addressLabel)
        self.discloseDisplay.addressLabel.text = address
        
        
    }
    func setSecretViewKey (secretViewKey: String) {
        
        //self.secretViewKeyControl.setSecretKey(secret: secretViewKey)
    }
    func setSecretSpendKey (secretSpendKey: String) {
        
        //self.secretSpendKeyControl.setSecretKey(secret: secretSpendKey)
    }
    
    
    //controls
    func setDisclosure( disclosed: Bool ) { /*set the disclosed state, and change the image as appropriate
                manually set instead of using button UIControlState to allow adequate customization */
        
        if (disclosed) {
            
            //self.discloseControl.setTitle("v", for: UIControlState.normal)
            
            //self.addressPreviewLabel.isHidden = true
            //self.disclosingDisplayAddress.isHidden = false
        }
        
        else {
            
            //self.discloseControl.setTitle(">", for: UIControlState.normal)
            
            //self.addressPreviewLabel.isHidden = false
            //self.disclosingDisplayAddress.isHidden = true
        }
        
        self.discloseDisplay.disclosed = disclosed
    }
    
    @IBAction func discloseActivated(_ sender: Any) {
       
        if (!self.discloseDisplay.disclosed) {
            
        UIView.animate(withDuration: 0.3, animations: {
            
            var frame: CGRect = self.discloseDisplay.frame
            frame.size.height += 350.0
            self.discloseDisplay.frame = frame
        })
            
            self.setDisclosure(disclosed: true)
            
        }
        
        else {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                var frame: CGRect = self.discloseDisplay.frame
                frame.size.height -= 350.0
                self.discloseDisplay.frame = frame
            })
            
           self.setDisclosure(disclosed: false)
        }
    }
    
    
    
}



 
