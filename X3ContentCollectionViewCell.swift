//
//  ContentCollectionViewCell.swift
//  testMenuHorizontal
//
//  Created by petaire on 18/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class X3ContentCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "pouet"
    let gfx = Gfx()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let ds = dataSource()
    
    lazy var customCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.collectionViewLayout = layout
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customCollectionView.register(X3ContentMenuCellCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(customCollectionView)
        customCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        customCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        customCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        customCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
//        customCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
        return CGSize(width: frame.size.width, height: 170)
        } else if indexPath.item == 3 {
            return CGSize(width: frame.size.width, height: 170)
        }else {
            return CGSize(width: frame.size.width/2, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVc = X2ViewController()
        newVc.title = "prout".uppercased()
        delegate.rootVC?.navigationController?.pushViewController(newVc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! X3ContentMenuCellCollectionViewCell
//        let colorsArray = gfx.getUiColorArray()
//        cell.backgroundColor = colorsArray[indexPath.item]
        cell.X3ImageView.image = UIImage(named: "NP\(indexPath.item)")
        cell.X3ImageView.contentMode = .scaleAspectFill
        cell.X3ImageView.clipsToBounds = true
        return cell
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
