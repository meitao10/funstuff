//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Mei Tao on 3/21/16.
//  Copyright © 2016 Mei Tao. All rights reserved.
//

import UIKit

class CalculatorButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 0.5
    }



}
