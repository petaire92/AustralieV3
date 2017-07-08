//
//  ContentCollectionViewCell.swift
//  testMenuHorizontal
//
//  Created by petaire on 18/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class X2ContentCollectionViewCell: UICollectionViewCell {
    
    var X1VC = X1ViewController()
    var X1View: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         X1View = X1VC.view
        X1View?.frame.size.height = UIScreen.main.bounds.size.height - 90
        addSubview(X1View!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        X1VC.dismiss(animated: false, completion: nil)
    }
    
}
