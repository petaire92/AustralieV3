//
//  A19.swift
//  australieV3
//
//  Created by petaire on 28/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class A24: UIView {
    var totalHeight: CGFloat?
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let plusSign: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "plus")
        button.setImage(image, for: .normal)
        return button
    }()
    
    init(labelText: String, titleText: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
        let gfx = Gfx()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = gfx.getUIColor(index: 9)
        titleLabel.font = gfx.font(style: 2)
        textLabel.font = gfx.font(style: 4)
        titleLabel.text = titleText
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        titleLabel.sizeToFit()
        addSubview(plusSign)
        plusSign.widthAnchor.constraint(equalToConstant: 32).isActive = true
        plusSign.heightAnchor.constraint(equalToConstant: 32).isActive = true
        layoutIfNeeded()
        totalHeight = titleLabel.frame.size.height + 50
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
