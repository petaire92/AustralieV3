//
//  CustomMenuCell.swift
//  australieV3
//
//  Created by petaire on 10/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class CustomMenuCell: UICollectionViewCell {
    let gfx = Gfx()
    
    let labelView : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let icoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .gray
        
        addSubview(icoImageView)
        icoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        icoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        icoImageView.heightAnchor.constraint(equalToConstant: gfx.icoMenuHeightAndWidth!).isActive = true
        icoImageView.widthAnchor.constraint(equalToConstant: gfx.icoMenuHeightAndWidth!).isActive = true
        
        addSubview(labelView)
        labelView.leftAnchor.constraint(equalTo: icoImageView.rightAnchor, constant: 20).isActive = true
        labelView.centerYAnchor.constraint(equalTo: icoImageView.centerYAnchor).isActive = true
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
}


