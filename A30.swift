//
//  A30.swift
//  australieV3
//
//  Created by petaire on 06/07/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class A30View : UIView {
    
//    let A30Label : LabelWithBlackBackGround = {
//        let label = LabelWithBlackBackGround()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .white
//        label.numberOfLines = 0
////        font = gfx.font(style: 3)
//        label.lineBreakMode = .byWordWrapping
//        label.sizeToFit()
//        return label
//    }()

    let A30Label : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(colorLabelBackground: UIColor, textLabel: String) {
        super.init(frame: .zero)
        addSubview(A30Label)
        A30Label.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        A30Label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        A30Label.text = textLabel
        A30Label.backgroundColor = colorLabelBackground
        A30Label.sizeToFit()
    }

//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//                addSubview(A30Label)
//                A30Label.topAnchor.constraint(equalTo: , constant: 15).isActive = true
//                A30Label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
//                A30Label.text = textLabel
//                A30Label.backgroundColor = colorLabelBackground
//                A30Label.sizeToFit()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
