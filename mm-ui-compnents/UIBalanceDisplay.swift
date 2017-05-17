//
//  UIBalanceDisplay.swift
//  mm-ui-compnents
//
//  Created by RedLion on 17/05/17.
//  Copyright © 2017 RedLion. All rights reserved.
//

import UIKit

class UIBalanceDisplay: UILabel {

    
    override func awakeFromNib() {
        
        self.font = UIFont(name: "Menlo", size: 25.0)
        self.backgroundColor = UIColor.gray
        self.textColor = UIColor.lightGray
        self.textAlignment = NSTextAlignment.center
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
    }
    
    func getBalance() -> Float! {
        
        return Float(self.text!)
    }
    
    func setBalance(balance: Float) {
        
        self.text = balance.description
    }

}
