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
    
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor.darkGray
        self.clipsToBounds = true
    }
}
