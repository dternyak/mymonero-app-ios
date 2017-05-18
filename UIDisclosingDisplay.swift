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
