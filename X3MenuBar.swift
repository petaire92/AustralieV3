//
//  MenuBar.swift
//  testMenuHorizontal
//
//  Created by petaire on 17/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit


class X3MenuBar: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Variables
    let cellId = "pouet"
    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    var horizontalBarWidthAnchorConstraint : NSLayoutConstraint?
    var goldenRatioForBar : CGFloat?
    var rootController : X3ViewController?
    let gfx = Gfx()
    
    // MARK: UI
    lazy var customCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = CGSize(width: 60, height: 30)
        let cv  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.collectionViewLayout = layout
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        
        
        customCollectionView.register(X3MenuCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(customCollectionView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: customCollectionView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: customCollectionView)
        customCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
        customCollectionView.showsHorizontalScrollIndicator = false
        let SelectedItem : IndexPath = IndexPath(item: 0, section: 0)
        customCollectionView.selectItem(at: SelectedItem, animated: false, scrollPosition: .centeredHorizontally)
        
        
    }
    
    // MARK: Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (gfx.arrayOfMenuText?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        customCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        rootController?.scrollToItemIndex(item: indexPath.item)
    }
    
    func scrollToItemIndex(item: Int)  {
        customCollectionView.selectItem(at: IndexPath(row: item, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! X3MenuCell
        cell.labelTitre.font = gfx.font(style: 4)
        cell.index = indexPath.item
        cell.labelTitre.sizeToFit()
        cell.labelTitre.text = gfx.arrayOfMenuText?[indexPath.item]
        
        return cell
    }
    
    deinit {
        self.dismiss(animated: true, completion: nil)
        rootController?.dismiss(animated: true, completion: nil)
        rootController?.menuBar = nil
        rootController?.menuBar?.dismiss(animated: true, completion: nil)
        rootController = nil
    }
}



