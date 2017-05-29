//
//  UIBalanceDisplay.swift
//  mm-ui-compnents
//
//  Created by RedLion on 17/05/17.
//  Copyright © 2017 RedLion. All rights reserved.
//

import UIKit

class UIBalanceDisplay: UILabel {

    
    var _balance: CGFloat = 0.0
    
    func layout() {
        
        self.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 36.0)
        self.backgroundColor = balanceLabelColour
        self.textColor = UIColor.white
        self.textAlignment = NSTextAlignment.left
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        
        //shadow
        
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 7.0
        self.layer.shadowColor = UIColor.black.cgColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("NOT_IMPLEMENTED")
    }
    
    func getBalance() -> CGFloat! {
        
        return self._balance
    }
    
    func setBalance(balance: CGFloat) {
        
        self._balance = balance
        self.text = "  " + balance.description //invisible padding
    }

}
