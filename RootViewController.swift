//
//  ViewController.swift
//  testMenuHorizontal
//
//  Created by petaire on 17/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class RootMenuController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Variables
    let cellID = "pouet"
    
    // MARK: UI
    lazy var mainCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        view.isPagingEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var menuBar : MenuBar = {
        let view = MenuBar()
        view.rootController = self
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        addMenuScrollView()
        addMainView()

    }
    
    // MARK: Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuBar.arrayOfMenuText.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let colors : [UIColor] = [.gray, .green, .red, .black, .white, .yellow, .orange, .blue, .purple]
        let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
        
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let screenWidth = UIScreen.main.bounds.size.width
        let itemIndex = Int(targetContentOffset.pointee.x / screenWidth)
        menuBar.scrollToItemIndex(item: itemIndex)
    }
    
    func scrollToItemIndex(item: Int)  {
        mainCollectionView.selectItem(at: IndexPath(row: item, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    
    
    //MARK: UI Methods
    func addMainView() {
        view.addSubview(mainCollectionView)
        mainCollectionView.topAnchor.constraint(equalTo: menuBar.view.bottomAnchor).isActive = true
        mainCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addMenuScrollView() {
        view.addSubview(menuBar.view)
        menuBar.view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        menuBar.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuBar.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuBar.view.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}


