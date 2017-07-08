//
//  X3ContentMenuCellCollectionViewCell.swift
//  australieV3
//
//  Created by petaire on 25/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class X3ContentMenuCellCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(X3ImageView)
        X3ImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        X3ImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        X3ImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        X3ImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(X3Label)
        X3Label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        X3Label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        X3Label.text = "Lorem Ipsum"
        X3Label.sizeToFit()
        
    }
    
    let X3ImageView : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let X3Label : LabelWithBlackBackGround = {
        let label = LabelWithBlackBackGround()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem Ipsum"
        label.textColor = .white
        label.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
