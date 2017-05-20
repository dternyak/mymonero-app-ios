//
//  UIDisclosingDisplay.swift
//  mm-ui-compnents
//
//  Created by RedLion on 17/05/17.
//  Copyright © 2017 RedLion. All rights reserved.
//

import UIKit

class UIDisclosingDisplay: UIView {

    
    
    var disclosed: Bool = false //hidden by default, so initalize with false
    
    
    var addressLabel: UILabel! //impilicitly unwrapped optionals since in swift on-optional values must be non-nil at super.init
    //and common initalizers are not yet possible
    var fullAddress: UILabel!
    var copyAddress: UIButton!
    
    var viewKeyLabel: UILabel!
    var fullSecretViewKeyControl: UISecretDisplayControl!
    var copySecretViewKey: UIButton!
    
    var spendKeyLabel: UILabel!
    var fullSecretSpendKeyControl: UISecretDisplayControl!
    var copySecretSpendKey: UIButton!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        generateDisclosingDisplayViews()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        generateDisclosingDisplayViews()
        layout()
    }
    
    func generateDisclosingDisplayViews() {
        
        let w: CGFloat = self.bounds.size.width
        let h: CGFloat = self.bounds.size.height
        
        let container: UIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: w - (w * 0.1), height: h - (h * 0.1)))
        container.center = CGPoint(x: w/2, y: h/2) //center in screen
        
        container.backgroundColor = UIColor.clear
        
        self.addSubview(container)
        
        let paddingSize: CGFloat = 20.0
        let buttonDimensions: CGRect = CGRect(x: 0.0, y: 0.0, width: 70.0, height: 20.0)
        
        
        //monero address
        self.addressLabel = UILabel(frame: CGRect(x: 0.0,
                                                          y: 0.0,
                                                          width: 200.0,
                                                          height: 30.0))
        self.addressLabel.text = "Address"
        container.addSubview(self.addressLabel)
        
        self.copyAddress = UIButton(frame: CGRect(x: container.bounds.size.width - buttonDimensions.size.width,
                                                           y: 0.0,
                                                           width: buttonDimensions.size.width,
                                                           height: buttonDimensions.size.height))
        container.addSubview(self.copyAddress)
        
        
        
        self.fullAddress = UILabel(frame: CGRect(x: 0.0,
                                                         y: addressLabel.bounds.size.height + paddingSize,
                                                         width: container.bounds.width,
                                                         height: 30.0))
        container.addSubview(self.fullAddress)
        
       
        //monero secret view key
        self.viewKeyLabel = UILabel(frame: CGRect(x: 0.0,
                                                          y: fullAddress.frame.origin.y + fullAddress.bounds.size.height + paddingSize,
                                                          width: 200.0,
                                                          height: 30.0))
        container.addSubview(viewKeyLabel)
        
        self.copySecretViewKey = UIButton(frame: CGRect(x: container.bounds.size.width - buttonDimensions.size.width,
                                                                 y: viewKeyLabel.frame.origin.y,
                                                                 width: buttonDimensions.size.width,
                                                                 height: buttonDimensions.size.height))
        container.addSubview(copySecretViewKey)
        
        self.fullSecretViewKeyControl = UISecretDisplayControl(frame: CGRect(x:0.0,
                                                                                             y: viewKeyLabel.frame.origin.y + viewKeyLabel.bounds.size.height + paddingSize,
                                                                                             width: container.bounds.width,
                                                                                             height: 30.0))
         container.addSubview(fullSecretViewKeyControl)
        
        //monero secret spend key
        
        self.spendKeyLabel = UILabel(frame: CGRect(x: 0.0,
                                                          y: fullSecretViewKeyControl.frame.origin.y + fullAddress.bounds.size.height + paddingSize,
                                                          width: 200.0,
                                                          height: 30.0))
        container.addSubview(spendKeyLabel)
        
        self.copySecretSpendKey = UIButton(frame: CGRect(x: container.bounds.size.width - buttonDimensions.size.width,
                                                                 y: spendKeyLabel.frame.origin.y,
                                                                 width: buttonDimensions.size.width,
                                                                 height: buttonDimensions.size.height))
        container.addSubview(copySecretSpendKey)
        
        self.fullSecretSpendKeyControl = UISecretDisplayControl(frame: CGRect(x:0.0,
                                                                                                    y: spendKeyLabel.frame.origin.y + viewKeyLabel.bounds.size.height + paddingSize,
                                                                                                    width: container.bounds.width,
                                                                                                    height: 30.0))
        container.addSubview(fullSecretSpendKeyControl)

       

        
        
       
        
        //testing
        
        addressLabel.backgroundColor = UIColor.red
        fullAddress.backgroundColor = UIColor.purple
        copyAddress.backgroundColor = UIColor.orange
        
        viewKeyLabel.backgroundColor = UIColor.red
        fullSecretViewKeyControl.backgroundColor = UIColor.purple
        copySecretViewKey.backgroundColor = UIColor.orange
        
        spendKeyLabel.backgroundColor = UIColor.red
        fullSecretSpendKeyControl.backgroundColor = UIColor.purple
        copySecretSpendKey.backgroundColor = UIColor.orange
        
        
        
    }
    
    func layout() {
        
        self.backgroundColor = UIColor.red
        self.clipsToBounds = true
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        
        self.layer.borderColor = UIColor(white: 0.3, alpha: 0.5).cgColor
        self.layer.borderWidth = 1.0
        
        self.addressLabel.text = "Address"
        self.viewKeyLabel.text = "Secret View Key"
        self.spendKeyLabel.text = "Secret Spend Key"
        
        self.addressLabel.textColor = UIColor.white
        self.viewKeyLabel.textColor = UIColor.white
        self.spendKeyLabel.textColor = UIColor.white
        
        self.copyAddress.setTitle("COPY", for: UIControlState.normal)
        self.copySecretViewKey.setTitle("COPY", for: UIControlState.normal)
        self.copySecretSpendKey.setTitle("COPY", for: UIControlState.normal)
    }
    
    
}
