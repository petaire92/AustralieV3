//
//  ViewController.swift
//  australieV3
//
//  Created by petaire on 05/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class A1ViewController: UIViewController {
    
    let data = dataSource()
//    let gfx = Gfx()
    weak var X1VC : X1ViewController?
    weak var X2VC : X2ViewController?
    weak var X3VC : X3ViewController?
    let cellID = "pouet"
    let delegate = UIApplication.shared.delegate as! AppDelegate

    // MARK: UI

    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.setMenu(navigationController: self.navigationController!, navigationItem: navigationItem, VC: self)
//        addViewContent()
        data.rootController = self
        self.delegate.rootVC = self
        addX1Controller()
    }

    func removeVC() {
        X1VC?.dismiss(animated: false, completion: nil)
        X2VC?.dismiss(animated: false, completion: nil)
        X2VC?.menuBar?.dismiss(animated: true, completion: nil)
        X3VC?.dismiss(animated: false, completion: nil)
        X3VC?.menuBar?.dismiss(animated: true, completion: nil)
    }
    
    
    func addX1Controller() {
//        X1VC = X1ViewController()
//        X1VC?.view.frame.size.height = UIScreen.main.bounds.size.height
        view.addSubview((X1ViewController().view)!)

    }
    


}


