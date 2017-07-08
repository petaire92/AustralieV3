//
//  ViewController.swift
//  testUICollectionView
//
//  Created by petaire on 30/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit
import Mapbox

class A26View: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, MGLMapViewDelegate {
    
    private let cellID = "pouet"
    let textViewHeight : CGFloat = 90
    var totalHeightArray : [CGFloat] = [0]
    private let gfx = Gfx()
    let heightOfMap : CGFloat = 200
    
    let annotationA = MGLPointAnnotation()
    let annotationB = MGLPointAnnotation()
    let annotationC = MGLPointAnnotation()
    let annotationD = MGLPointAnnotation()
    var annotationArray : [MGLPointAnnotation]?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        annotationArray = [annotationA, annotationB, annotationC, annotationD]
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(A26TitleLabel)
        A26TitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        A26TitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        A26TitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        A26TitleLabel.text = "Visite de Sydney"
        A26TitleLabel.font = gfx.font(style: 2)
        A26TitleLabel.sizeToFit()
        addSubview(A26CollectionView)
        A26CollectionView.topAnchor.constraint(equalTo: A26TitleLabel.bottomAnchor, constant: 5).isActive = true
        A26CollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        A26CollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        A26CollectionView.heightAnchor.constraint(equalToConstant: textViewHeight+gfx.getImageHeight()+8+15).isActive = true
        A26CollectionView.register(A26Cell.self, forCellWithReuseIdentifier: cellID)
        A26CollectionView.dataSource = self
        A26CollectionView.delegate = self
        addSubview(A26MapView)
        A26MapView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        A26MapView.topAnchor.constraint(equalTo: A26CollectionView.bottomAnchor).isActive = true
        A26MapView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        A26MapView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        annotationB.coordinate = CLLocationCoordinate2D(latitude: -33.8535655714918, longitude: 151.210100405882)
        annotationB.title = "Point B"
        annotationC.coordinate = CLLocationCoordinate2D(latitude: -33.8572482425679, longitude: 151.21525022805)
        annotationC.title = "Point C"
        annotationA.coordinate = CLLocationCoordinate2D(latitude: -33.8558583500238, longitude: 151.207239393345)
        annotationA.title = "Point A"
        annotationD.coordinate = CLLocationCoordinate2D(latitude: -33.8641939152088, longitude: 151.216271007834)
        annotationD.title = "Point D"
        A26MapView.addAnnotations(annotationArray!)
    }
    
    lazy var A26MapView: MGLMapView = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.heightOfMap)
        let mapView = MGLMapView(frame: frame, styleURL: MGLStyle.outdoorsStyleURL(withVersion: 9))
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.delegate = self
        mapView.attributionButton.alpha = 0
        mapView.logoView.alpha = 0
        mapView.isRotateEnabled = false
        mapView.setCenter(CLLocationCoordinate2D(latitude: -33.8523063, longitude: 151.2064097), zoomLevel: 14, animated: false)
        return mapView
    }()
    
    //    let A26MapView: UIView = {
    ////        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.heightOfMap)
    //        let mapView = UIView()
    //        mapView.translatesAutoresizingMaskIntoConstraints = false
    //        mapView.backgroundColor = .red
    //        return mapView
    //    }()
    
    let A26CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let A26TitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = A26CollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! A26Cell
        cell.heightTextView = textViewHeight
        let cellString = gfx.loremIpsum[indexPath.item]
        cell.A26TextView.text = cellString
        
        let text = gfx.colorMyString(string1: "\(indexPath.item + 1) ", string2: "Test de lignes multiples ouais mon gars", colorOfString1: .red, colorOfString2: .white, font: gfx.font(style: 2))
        cell.A26CellImageViewTitleLabel.attributedText = text
        cell.A26CellimageView.image = UIImage(named: "opera\(indexPath.item)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        return CGSize(width: UIScreen.main.bounds.size.width - 40, height: totalHeightArray.max()!+gfx.getImageHeight()+8+A26TitleLabel.frame.size.height+20+A26MapView.frame.size.height+15)
        return CGSize(width: UIScreen.main.bounds.size.width - 40, height: textViewHeight+gfx.getImageHeight()+8+A26TitleLabel.frame.size.height+20)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        let pageWidth:Float = Float(self.bounds.width)
        let minSpace:Float = 1.0
        var cellToSwipe:Double = Double(Float((scrollView.contentOffset.x))/Float((pageWidth+minSpace))) + Double(0.5)
        if cellToSwipe < 0 {
            cellToSwipe = 0
        } else if cellToSwipe >= Double(4) {
            cellToSwipe = Double(4) - Double(1)
        }
        let indexPath:IndexPath = IndexPath(row: Int(cellToSwipe), section:0)
        self.A26CollectionView.scrollToItem(at:indexPath, at: UICollectionViewScrollPosition.left, animated: true)
        A26MapView.setCenter((annotationArray?[indexPath.item].coordinate)!, animated: true)
    }
    
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        let indexAnnotation = annotationArray?.index(of: annotation as! MGLPointAnnotation)
        self.A26CollectionView.scrollToItem(at: [0,indexAnnotation!], at: UICollectionViewScrollPosition.left, animated: true)
        mapView.setCenter(annotation.coordinate, animated: true)
    }
    
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return nil
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class A26Cell: UICollectionViewCell {
    
    private let gfx = Gfx()
    var heightTextView : CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(A26CellimageView)
        A26CellimageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        A26CellimageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        A26CellimageView.heightAnchor.constraint(equalToConstant: gfx.getImageHeight()).isActive = true
        A26CellimageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //        addSubview(A26CellLabel)
        //        A26CellLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        //        A26CellLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        //        A26CellLabel.topAnchor.constraint(equalTo: A26CellimageView.bottomAnchor, constant: 8).isActive = true
        //        A26CellLabel.sizeToFit()
        addSubview(A26TextView)
        A26TextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        A26TextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        A26TextView.topAnchor.constraint(equalTo: A26CellimageView.bottomAnchor, constant: 8).isActive = true
        A26TextView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        //        A26TextView.sizeToFit()
        addSubview(A26CellImageViewTitleLabel)
        A26CellImageViewTitleLabel.bottomAnchor.constraint(equalTo: A26CellimageView.bottomAnchor, constant: -5).isActive = true
        A26CellImageViewTitleLabel.leftAnchor.constraint(equalTo: A26CellimageView.leftAnchor, constant: 0).isActive = true
        A26CellImageViewTitleLabel.rightAnchor.constraint(lessThanOrEqualTo: A26CellimageView.rightAnchor, constant: -5).isActive = true
        A26CellImageViewTitleLabel.sizeToFit()
        A26CellimageView.backgroundColor = gfx.getUIColor(index: 9)
        A26TextView.font = gfx.font(style: 3)
        A26TextView.textColor = gfx.getUIColor(index: 9)
        //        A26CellImageViewTitleLabel.font = gfx.font(style: 2)
        
    }
    
    let A26CellimageView : UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let A26CellImageViewTitleLabel : LabelWithBlackBackGround = {
        let label = LabelWithBlackBackGround()
        label.numberOfLines = 0
        label.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let A26CellLabel : UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let A26TextView : UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        
        tv.text = "Test"
        return tv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


