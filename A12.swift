//
//  A11.swift
//  australieV3
//
//  Created by petaire on 20/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class A12 : UILabel {
    
    var A11text: String?
    
   init(A11text: String) {
        super.init(frame: .zero)
        self.text = A11text
        let gfx = Gfx()
        textColor = gfx.getUIColor(index: 9)
        numberOfLines = 0
        font = gfx.font(style: 3)
        lineBreakMode = .byWordWrapping
        sizeToFit()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
