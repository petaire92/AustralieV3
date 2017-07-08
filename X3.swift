//
//  ViewController.swift
//  testMenuHorizontal
//
//  Created by petaire on 17/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class X3ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Variables
    let cellID = "pouet"
    let gfx = Gfx()
    var cell : X3ContentCollectionViewCell?
    
    // MARK: UI
    let titleView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
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
    
     lazy var menuBar : X3MenuBar? = {
        let view = X3MenuBar()
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
        mainCollectionView.register(X3ContentCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        addMenuScrollView()
        addMainView()
        
    }
    
    // MARK: Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (gfx.arrayOfMenuText?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? X3ContentCollectionViewCell

        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height-25)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let screenWidth = UIScreen.main.bounds.size.width
        let itemIndex = Int(targetContentOffset.pointee.x / screenWidth)
        menuBar?.scrollToItemIndex(item: itemIndex)
    }
    
    func scrollToItemIndex(item: Int)  {
        mainCollectionView.selectItem(at: IndexPath(row: item, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }

    
    
    //MARK: UI Methods
    
    
    func addMainView() {
        view.addSubview(mainCollectionView)
        mainCollectionView.topAnchor.constraint(equalTo: (menuBar?.view.bottomAnchor)!).isActive = true
        mainCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func addTitleView() {
        view.addSubview(titleView)
        titleView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: gfx.X1ViewTitleHeigth!).isActive = true
    }
    
    func addMenuScrollView() {
        view.addSubview((menuBar?.view)!)
        menuBar?.view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        menuBar?.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuBar?.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuBar?.view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    deinit {
        self.dismiss(animated: false, completion: nil)
        menuBar?.dismiss(animated: true, completion: nil)
        menuBar?.rootController?.dismiss(animated: true, completion: nil)
        menuBar?.rootController = nil
        menuBar = nil
    }
    
}


