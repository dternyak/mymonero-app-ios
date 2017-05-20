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
        let addressLabel: UILabel = UILabel(frame: CGRect(x: 0.0,
                                                          y: 0.0,
                                                          width: 100.0,
                                                          height: 30.0))
        addressLabel.text = "Address"
        container.addSubview(addressLabel)
        
        let copyAddress: UIButton = UIButton(frame: CGRect(x: container.bounds.size.width - buttonDimensions.size.width,
                                                           y: 0.0,
                                                           width: buttonDimensions.size.width,
                                                           height: buttonDimensions.size.height))
        container.addSubview(copyAddress)
        
        
        
        let fullAddress: UILabel = UILabel(frame: CGRect(x: 0.0,
                                                         y: addressLabel.bounds.size.height + paddingSize,
                                                         width: container.bounds.width,
                                                         height: 30.0))
        container.addSubview(fullAddress)
        
       
        //monero secret view key
        let viewKeyLabel: UILabel = UILabel(frame: CGRect(x: 0.0,
                                                          y: fullAddress.frame.origin.y + fullAddress.bounds.size.height + paddingSize,
                                                          width: 100.0,
                                                          height: 30.0))
        container.addSubview(viewKeyLabel)
        
        let copySecretViewKey: UIButton = UIButton(frame: CGRect(x: container.bounds.size.width - buttonDimensions.size.width,
                                                                 y: viewKeyLabel.frame.origin.y,
                                                                 width: buttonDimensions.size.width,
                                                                 height: buttonDimensions.size.height))
        container.addSubview(copySecretViewKey)
        
        let fullSecretViewKeyControl: UISecretDisplayControl = UISecretDisplayControl(frame: CGRect(x:0.0,
                                                                                             y: viewKeyLabel.frame.origin.y + viewKeyLabel.bounds.size.height + paddingSize,
                                                                                             width: container.bounds.width,
                                                                                             height: 30.0))
        
        //monero secret spend key
        
        let spendKeyLabel: UILabel = UILabel(frame: CGRect(x: 0.0,
                                                          y: fullSecretViewKeyControl.frame.origin.y + fullAddress.bounds.size.height + paddingSize,
                                                          width: 100.0,
                                                          height: 30.0))
        container.addSubview(spendKeyLabel)
        
        let copySecretSpendKey: UIButton = UIButton(frame: CGRect(x: container.bounds.size.width - buttonDimensions.size.width,
                                                                 y: spendKeyLabel.frame.origin.y,
                                                                 width: buttonDimensions.size.width,
                                                                 height: buttonDimensions.size.height))
        container.addSubview(copySecretSpendKey)
        
        let fullSecretSpendKeyControl: UISecretDisplayControl = UISecretDisplayControl(frame: CGRect(x:0.0,
                                                                                                    y: spendKeyLabel.frame.origin.y + viewKeyLabel.bounds.size.height + paddingSize,
                                                                                                    width: container.bounds.width,
                                                                                                    height: 30.0))
        container.addSubview(fullSecretSpendKeyControl)

       

        
        
        container.addSubview(fullSecretViewKeyControl)
        
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
    
    override func layoutSubviews() {
        
        self.generateDisclosingDisplayViews()
    }
    
    func layout() {
        
        self.backgroundColor = MMDarkGray
        self.clipsToBounds = true
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        
        self.layer.borderColor = UIColor(white: 0.3, alpha: 0.5).cgColor
        self.layer.borderWidth = 1.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layout()
    }
    
    
    override func awakeFromNib() {
        
        //self.layout()
    }
}
