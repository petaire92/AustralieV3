//
//  data.swift
//  australieV3
//
//  Created by petaire on 08/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

class dataSource : NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //Mark: Variables
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let cellID = "cellID"
    let blackView = UIView()
    static var array = NSArray(contentsOfFile: Bundle.main.path(forResource: "Australie", ofType: "plist")!)!
    let gfx = Gfx()
    var rootController: A1ViewController?
    
    //Mark: ViewDidLoad/Init
    override init() {
        
        super.init()
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.register(CustomMenuCell.self, forCellWithReuseIdentifier: "cellID")
        
    }
    
    //Mark: UI
    
    let menuCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        
        return collectionView
    }()
    
    let blackMenuView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    //Mark: Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getNumberOfRootSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CustomMenuCell
        
        if let array = dataSource.array[indexPath.row] as? NSDictionary {
            if let gfxDico = array["gfx"] as? NSDictionary {
                if let color = gfxDico["color"] as? Int {
                    cell?.backgroundColor = gfx.getUIColor(index: color)
                }
                
                if let imageUnfold = gfxDico["miniLogo"] as? String {
                    let image = UIImage(named: imageUnfold)
                    cell?.icoImageView.image = image
                }
                if let text = gfxDico["titre"] as? String {
                    cell?.labelView.text = text.uppercased()
                    let font = gfx.font(style: 1)
                    cell?.labelView.font = font
                    cell?.labelView.textColor = UIColor.white
                    
                }
            }
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: gfx.cellHeight!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func getDicoSection(sectionNumber: Int) -> NSDictionary {
        var dico = NSDictionary()
        dico = dataSource.array[sectionNumber] as! NSDictionary
        return dico
    }
    
    func getNumberOfRootSections() -> Int {
        return dataSource.array.count
    }
    
    func menuButtonSelected() {
        if let window = UIApplication.shared.keyWindow {
            
            blackView.frame = window.frame
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissView)))
            
            blackView.alpha = 0
            window.rootViewController?.view.addSubview(blackView)
            window.rootViewController?.view.addSubview(menuCollectionView)
            
            let y = (window.rootViewController?.view.frame.size.height)! - (gfx.cellHeight! * CGFloat(getNumberOfRootSections()))
            menuCollectionView.frame = CGRect(x: 0, y: (window.rootViewController?.view.frame.size.height)!, width: (window.rootViewController?.view.frame.size.width)! - 10, height: CGFloat(getNumberOfRootSections()) * gfx.cellHeight!)
            
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.menuCollectionView.frame = CGRect(x: 5, y: y, width: (window.rootViewController?.view.frame.size.width)! - 10, height:  CGFloat(self.getNumberOfRootSections()) * self.gfx.cellHeight!)
            }, completion: nil)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch indexPath.item {
        case 0:
            presentNewVc(newVC: X1ViewController(), sourceVC: delegate.rootVC!)
            handleDismissView()
        case 1:
            presentNewVc(newVC: X2ViewController(), sourceVC: delegate.rootVC!)
            handleDismissView()
        case 2:
            presentNewVc(newVC: X3ViewController(), sourceVC: delegate.rootVC!)
            handleDismissView()
            
        default:
            presentNewVc(newVC: X2ViewController(), sourceVC: delegate.rootVC!)
            handleDismissView()
            
        }
        
    }
    
    
    
    func presentNewVc(newVC: AnyObject, sourceVC: A1ViewController) {
        UIView.animate(withDuration: 0.6, animations: {
            for view in (sourceVC.view.subviews) {
                view.alpha = 0
                view.removeFromSuperview()
            }
            sourceVC.removeVC()
            //            sourceVC.X1VC?.dismiss(animated: true, completion: nil)
            
        }) { (true) in
            if newVC is X1ViewController {
                sourceVC.X1VC = newVC as? X1ViewController
            } else if newVC is X2ViewController {
                sourceVC.X2VC = newVC as? X2ViewController
            } else if newVC is X3ViewController {
                sourceVC.X3VC = newVC as? X3ViewController
            }
            sourceVC.view.addSubview(newVC.view)
            newVC.view.frame.size.height = UIScreen.main.bounds.size.height - (self.delegate.rootVC?.navigationController?.navigationBar.bounds.size.height)! - 15
            sourceVC.title = "Pouet".uppercased()
            
            
        }
    }
    
    func handleDismissView() {
        UIView.animate(withDuration: 0.1) {
            if let window = UIApplication.shared.keyWindow {
                self.menuCollectionView.frame = CGRect(x: 5, y: (window.rootViewController?.view.frame.size.height)!, width: (window.rootViewController?.view.frame.size.width)! - 10, height:  CGFloat(self.getNumberOfRootSections()) * self.gfx.cellHeight!)
            }
            self.blackView.alpha = 0
        }
    }
    
    //Mark: UI Methods
    
    
    func setMenu(navigationController: UINavigationController, navigationItem: UINavigationItem, VC: UIViewController) {
        let menuButtonImage = UIImage(named: "threeLinesMenu")?.withRenderingMode(.alwaysTemplate)
        let menuButton = UIBarButtonItem(image: menuButtonImage , style: .plain, target: self, action: #selector(dataSource.menuButtonSelected))
        menuButton.tintColor = gfx.getUIColor(index: 10)
        navigationController.navigationBar.isTranslucent = false // permet de faire en sorte que la view ne soit pas derrière la navigationBar
        navigationController.navigationBar.barTintColor = gfx.getUIColor(index: 9)
        navigationController.navigationBar.tintColor = UIColor.red
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: gfx.font(style: 2)], for: .normal)
        navigationController.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName: gfx.font(style: 2)]
        VC.title = "Australie".uppercased()
        navigationItem.rightBarButtonItem = menuButton
        
    }
}


