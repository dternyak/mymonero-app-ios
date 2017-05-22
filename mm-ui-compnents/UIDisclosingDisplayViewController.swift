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
    
    //discloseView
    //@IBOutlet weak var discloseControl: UIButton!
    
    //subviews of discloseView
    //@IBOutlet weak var addressPreviewLabel: UILabel!
    @IBAction func secretDisplayControlToggled(_ sender: UISecretDisplayControl) {
        
        
        sender.toggleState()
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.layout()
        
        self.discloseDisplay.fullAddress.textColor = MMLightGrayText
        self.discloseDisplay.fullAddress.font = MMStandardFont
        
        self.initControls()
        
        //test
        self.setAddress(address: "01234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234")
        self.balanceDisplay.setBalance(balance: 111.999)
        self.setSecretViewKey(secretViewKey: "0123456789012345678901234567890123456789")
        self.setSecretSpendKey(secretSpendKey: "0123456789012345678901234567890123456789")
    }
    
    func copyCC(_ sender: UIButton) {
        
        if(sender == self.discloseDisplay.copyAddress) {
            
            print("COPY ADDRESS") //for testing
            UIPasteboard.general.string = self.discloseDisplay.fullAddress.text
            print(UIPasteboard.general.string as String!)
        }
        
        else if (sender == self.discloseDisplay.copySecretViewKey) {
        
            print("COPY SECRET VIEW KEY")
            UIPasteboard.general.string = self.discloseDisplay.fullSecretViewKeyControl.titleLabel?.text
            print(UIPasteboard.general.string as String!)
        }
        
        else if (sender == self.discloseDisplay.copySecretSpendKey) {
            
            print("COPY SECRET SPEND KEY")
            UIPasteboard.general.string = self.discloseDisplay.fullSecretSpendKeyControl.titleLabel?.text
            print(UIPasteboard.general.string as String!)
        }
    }
    
    func initControls() {
        
        self.discloseDisplay.fullSecretViewKeyControl.addTarget(self,
                                                          action: #selector(UIDisclosingDisplayViewController.secretDisplayControlToggled(_:)), for: .touchUpInside)
        self.discloseDisplay.fullSecretSpendKeyControl.addTarget(self,
                                                                action: #selector(UIDisclosingDisplayViewController.secretDisplayControlToggled(_:)), for: .touchUpInside)
        
        self.discloseDisplay.copyAddress.addTarget(self,
                                                   action: #selector(UIDisclosingDisplayViewController.copyCC(_:)), for: .touchUpInside)
        self.discloseDisplay.copySecretViewKey.addTarget(self,
                                                   action: #selector(UIDisclosingDisplayViewController.copyCC(_:)), for: .touchUpInside)
        self.discloseDisplay.copySecretSpendKey.addTarget(self,
                                                         action: #selector(UIDisclosingDisplayViewController.copyCC(_:)), for: .touchUpInside)
        
        self.discloseDisplay.discloseControl.addTarget(self, action: #selector(UIDisclosingDisplayViewController.discloseActivated(_:)), for: .touchUpInside)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func layout() {
        
        let containerView: UIView = self.constructContainer()
        
        self.constructBalanceDisplay(superview: containerView)
        self.constructDiscloseDisplay(superview: containerView)
        
        /*self.constructControls(superview: self.discloseDisplay) /*add discloseControl to discloseDisplay rather than the container
                                                                        superview*/*/

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
        
        borderContainer.backgroundColor = UIColor.yellow
        
        self.view.addSubview(borderContainer)
        
        return borderContainer
    }
    
    
    
    func constructBalanceDisplay(superview: UIView) {
        
        let balanceDisplay_r: CGRect = CGRect (x: 0, y: 0, width: superview.bounds.width * 1.0, height: 80.0)
        self.balanceDisplay = UIBalanceDisplay(frame: balanceDisplay_r)
        balanceDisplay.center = CGPoint(x: superview.bounds.width/2, y: balanceDisplay.bounds.height/2)
        
        //b.backgroundColor = UIColor.red
        
        superview.addSubview(balanceDisplay)
    }
    
    func constructDiscloseDisplay(superview: UIView) {
        
         self.discloseDisplay = UIDisclosingDisplay(frame: CGRect(
            x: 0.0,
            y: 100.0,
            width: superview.bounds.width,
            height: 500.0)) //refactor so height is dynamically determined
        
        self.discloseDisplay.backgroundColor = UIColor.red
        
        superview.addSubview(self.discloseDisplay)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //layout
        self.view.backgroundColor = MMDarkGray
        /*self.discloseDisplay.frame = CGRect(x: self.discloseDisplay.frame.origin.x,
                                            y: self.discloseDisplay.frame.origin.y,
                                            width: self.discloseDisplay.frame.size.width,
                                            height: 50.0)*/
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
        
        //self.discloseDisplay.addressLabel.text = address
        self.discloseDisplay.fullAddress.text = address
        
        
    }
    func setSecretViewKey (secretViewKey: String) {
        
        self.discloseDisplay.fullSecretViewKeyControl.setSecretKey(secret: secretViewKey)
    }
    func setSecretSpendKey (secretSpendKey: String) {
        
        self.discloseDisplay.fullSecretSpendKeyControl.setSecretKey(secret: secretSpendKey)
    }
    
    
    //controls
    func setDisclosure( disclosed: Bool ) { /*set the disclosed state, and change the image as appropriate
                manually set instead of using button UIControlState to allow adequate customization */
        
        if (disclosed) {
            
            self.discloseDisplay.discloseControl.setTitle("v", for: UIControlState.normal)
            
            //self.addressPreviewLabel.isHidden = true
            //self.disclosingDisplayAddress.isHidden = false
        }
        
        else {
            
            self.discloseDisplay.discloseControl.setTitle(">", for: UIControlState.normal)
            
            //self.addressPreviewLabel.isHidden = false
            //self.disclosingDisplayAddress.isHidden = true
        }
        
        self.discloseDisplay.disclosed = disclosed
    }
    
    @IBAction func discloseActivated(_ sender: Any) {
       
        if (!self.discloseDisplay.disclosed) {
            
        UIView.animate(withDuration: 0.3, animations: {
            
            var frame: CGRect = self.discloseDisplay.frame
            frame.size.height += 350.0 //refactor to resize to original height
            self.discloseDisplay.frame = frame
        })
            
            self.setDisclosure(disclosed: true)
            
        }
        
        else {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                var frame: CGRect = self.discloseDisplay.frame
                frame.size.height -= 350.0 //refactor to resize to original height
                self.discloseDisplay.frame = frame
            })
            
           self.setDisclosure(disclosed: false)
        }
    }
    
    
    
}



 
