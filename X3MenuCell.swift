//
//  MenuCell.swift
//  testMenuHorizontal
//
//  Created by petaire on 18/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit
class X3MenuCell: UICollectionViewCell {
    
    let gfx = Gfx()
    var cellFont = UIFont()
    var index: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        index = 0
        cellFont = gfx.font(style: 2)
        setupViews()
    }
    
    override var isSelected: Bool {
        didSet {
            labelTitre.textColor = isSelected ? UIColor.white : .lightGray
            self.backgroundColor = isSelected ? gfx.getUIColor(index: index!) : .white
        }
    }
    
    let labelTitre : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(labelTitre)
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: labelTitre)
        addConstraintsWithFormat(format: "V:[v0]", views: labelTitre)
        addConstraint(NSLayoutConstraint(item: labelTitre, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: labelTitre, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
