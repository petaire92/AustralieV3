//
//  A29.swift
//  australieV3
//
//  Created by petaire ovar5/07/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class  A29View: UIView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        
        let gfx = Gfx()
        
        addSubview(A29ImageView)
        A29ImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        A29ImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        A29ImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        A29ImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        A29ImageView.addSubview(subtitleLabel)
        subtitleLabel.bottomAnchor.constraint(equalTo: A29ImageView.bottomAnchor, constant: -60).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: A29ImageView.leftAnchor).isActive = true
        subtitleLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua."
        subtitleLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -15).isActive = true
        subtitleLabel.textColor = .white
        subtitleLabel.font = gfx.font(style: 2)
        subtitleLabel.sizeToFit()
        
        A29ImageView.addSubview(titleLabel)
        titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: A29ImageView.leftAnchor).isActive = true
        titleLabel.text = "Lorem Ipsum"
        titleLabel.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: -15).isActive = true
        titleLabel.textColor = .white
        titleLabel.font = gfx.font(style: 6)
        titleLabel.sizeToFit()
        
    }
    
    let A29ImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Kakadu")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel : LabelWithBlackBackGround = {
        let label = LabelWithBlackBackGround()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4)
        label.numberOfLines = 0
        return label
    }()
    
    let subtitleLabel : LabelWithBlackBackGround = {
        let label = LabelWithBlackBackGround()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4)
        label.numberOfLines = 0
//        label.topInset = 5
//        label.bottomInset = 5
//        label.leftInset = 5
//        label.rightInset = 5
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
