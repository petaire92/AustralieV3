//
//  X1.swift
//  australieV3
//
//  Created by petaire on 20/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class X1ViewController: UIViewController {
    
    //Mark: Variables
    let gfx = Gfx()
    let ds = dataSource()
    var array = [210, 300, 460, 330, 300, 210, 230, 190, 80, 250, 180, 150]
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        return scrollView
    }()
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Introduction"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let titleView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let icoView : UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "NPMiniLogo")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    //Mark: init
    override func viewDidLoad() {
        super.viewDidLoad()
        //Mark: UI
        
        //        contentStackView.backgroundColor = gfx.getUIColor(index: 4)
        titleView.backgroundColor = gfx.getUIColor(index: 3)
        titleLabel.font = gfx.font(style: 2)
        var array : [Double] = [21, 21.3, 19.5, 16.4, 13.7, 11.4, 10.7, 11.8, 13.5, 15.4, 17, 19.3]
        var array2 : [Double] = [460, 21, 300, 330, 70]
        var months1 = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
        var months2 = ["J", "F", "M", "A"]
        
        let fakeGraph = A27(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200), bestMonths: [1,2,3], arrayOfDataPerMonth: array, upperBackgroundColor: gfx.getUIColor(index: 9), lineColor: gfx.getUIColor(index: 4), bottomBackgroundColor: .white, titleColor: .white, monthFont: gfx.font(style: 3), monthColor: .lightGray, bestMonthsColor: .green, titleFont: gfx.font(style: 2), subtitleFont: gfx.font(style: 3), legendColor: .white, legendFont: gfx.font(style: 4), graphTitle: "Pouet", subtitle: "(en pouets)", months: months1)
        
        let fakeGraph2 = A27(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200), bestMonths: [1,2,3,4,5], arrayOfDataPerMonth: array2, upperBackgroundColor: gfx.getUIColor(index: 9), lineColor: gfx.getUIColor(index: 3), bottomBackgroundColor: .white, titleColor: .white, monthFont: gfx.font(style: 3), monthColor: .red, bestMonthsColor: .green, titleFont: gfx.font(style: 2), subtitleFont: gfx.font(style: 3), legendColor: .white, legendFont: gfx.font(style: 4), graphTitle: "Pouet", subtitle: "(en pouets)", months: months2)
        
        //Mark: UIMethods
        
        func addTitleView() {
            view.addSubview(titleView)
            titleView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            titleView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            titleView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            titleView.heightAnchor.constraint(equalToConstant: gfx.X1ViewTitleHeigth!).isActive = true
        }
        
        func addTitleLabel() {
            titleView.addSubview(titleLabel)
            titleLabel.leftAnchor.constraint(equalTo: icoView.rightAnchor, constant: 10).isActive = true
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
        }
        
        func addIcoView() {
            titleView.addSubview(icoView)
            icoView.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 10).isActive = true
            icoView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            icoView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            icoView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        }
        
        func addScrollView() {
            view.addSubview(scrollView)
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
        addTitleView()
        addIcoView()
        addTitleLabel()
        addScrollView()
        
        gfx.populateMainViewWithA29(mainView: scrollView, topConstraint: nil)
        
        
        gfx.populateMainViewWithA27(mainView: scrollView, topConstraint: 15, bestMonths: [1,2,3,4,5], arrayOfDataPerMonth: array, upperBackgroundColor: gfx.getUIColor(index: 9), lineColor: gfx.getUIColor(index: 7), bottomBackgroundColor: .white, titleColor: .white, monthFont: gfx.font(style: 3), monthColor: .lightGray, bestMonthsColor: .green, titleFont: gfx.font(style: 2), subtitleFont: gfx.font(style: 3), legendColor: .white, legendFont: gfx.font(style: 4), graphTitle: "Pouet", subtitle: "(en pouets)", months: months1)
        
        gfx.populateMainViewWithA26(mainView: scrollView, topConstraint: nil)
        
        gfx.populateMainViewWithA12(mainView: scrollView, text: gfx.loremIpsum[2], topConstraint: nil)
        
        gfx.populateMainViewWithA19(mainView: scrollView, topConstraint: nil, title: "Titre Test", text: gfx.loremIpsum[3])
        
        //        gfx.populateMainViewWithA17(mainView: scrollView, topConstraint: nil, extinctIndex: 0)
        
        gfx.populateMainViewWithA12(mainView: scrollView, text: gfx.loremIpsum[1], topConstraint: nil)
        
        gfx.populateMainViewWithA12(mainView: scrollView, text: gfx.loremIpsum[3], topConstraint: nil)
        
        gfx.populateMainViewWithA12(mainView: scrollView, text: gfx.loremIpsum[0], topConstraint: nil)
        
        //        gfx.populateMainViewWithA30(mainView: scrollView, topConstraint: nil, text: "Test", color: .black)
        
        view.layoutIfNeeded()
        
        
    }
    

    
    override func viewDidLayoutSubviews() {
        scrollView.updateContentViewSize()
    }
    
    deinit {
        self.dismiss(animated: true, completion: nil)
  
    }
    
}
