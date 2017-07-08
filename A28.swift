//
//  ViewController.swift
//  testUICollectionView
//
//  Created by petaire on 30/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class A28View: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellID = "pouet"
    var totalHeightArray : [CGFloat] = [0]
    private let gfx = Gfx()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(A28CollectionView)
        for text in gfx.loremIpsum {
            let newValue = text.height(for: UIScreen.main.bounds.size.width - 30, font: gfx.font(style: 3))
            totalHeightArray.append(newValue)
        }
        A28CollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        A28CollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        A28CollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        A28CollectionView.heightAnchor.constraint(equalToConstant: totalHeightArray.max()!+gfx.getImageHeight()+8).isActive = true
        A28CollectionView.register(A28Cell.self, forCellWithReuseIdentifier: cellID)
        A28CollectionView.dataSource = self
        A28CollectionView.delegate = self
        
    }
    
    
    let A28CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.isPagingEnabled = true
        cv.backgroundColor = .clear
        return cv
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = A28CollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! A28Cell
        let cellString = gfx.loremIpsum[indexPath.item]
        cell.A28CellTextView.text = cellString
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: totalHeightArray.max()!+gfx.getImageHeight()+8)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class A28Cell: UICollectionViewCell {
    
    private let gfx = Gfx()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(A28CellimageView)
        A28CellimageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        A28CellimageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        A28CellimageView.heightAnchor.constraint(equalToConstant: gfx.getImageHeight()).isActive = true
        A28CellimageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        addSubview(A28CellTextView)
        A28CellTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        A28CellTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        A28CellTextView.topAnchor.constraint(equalTo: A28CellimageView.bottomAnchor, constant: 8).isActive = true
        A28CellTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        A28CellimageView.backgroundColor = gfx.getUIColor(index: 9)
        A28CellTextView.font = gfx.font(style: 3)
        A28CellTextView.textColor = gfx.getUIColor(index: 9)
    }
    
    let A28CellimageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "opera")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let A28CellTextView : UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        return tv
    }()
    
//    let A28CellLabel : UILabel = {
//        let label = UILabel()
//        
//        label.numberOfLines = 0
//        label.backgroundColor = .white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
