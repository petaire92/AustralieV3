//
//  GFX.swift
//  australieV3
//
//  Created by petaire on 11/06/2017.
//  Copyright © 2017 petaire. All rights reserved.
//

import UIKit

class Gfx: NSObject {
    
    var arrayOfMenuText : [String]?
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    let loremIpsum = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nunc odio, euismod et lacus a, facilisis facilisis metus. Vestibulum at fermentum nibh. Suspendisse potenti. Ut enim ad minim veniam, quis nostrud exercitation. Pellentesque habitant morbi tristique senectus et netus. Ullamco laboris nisi ut aliquid ex ea commodi consequat. Praeterea iter est quasdam res quas ex communi. Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae.",
                      "Aliquam erat volutpat. Mauris tristique justo ac nunc commodo, ut blandit sapien efficitur. Proin mattis accumsan eros. Duis eget sem porta, hendrerit arcu ac, facilisis nulla.Ut enim ad minim veniam, quis nostrud exercitation. Pellentesque habitant morbi tristique senectus et netus. Ullamco laboris nisi ut aliquid ex ea commodi consequat. Praeterea iter est quasdam res quas ex communi. Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae.",
                      "In aliquam congue ullamcorper. Nam suscipit tincidunt velit, sed vulputate dui pretium ut. Aenean in blandit nulla. Donec erat metus, consectetur vitae erat consectetur, vulputate mollis urna. Ut enim ad minim veniam, quis nostrud exercitation. Pellentesque habitant morbi tristique senectus et netus. Ullamco laboris nisi ut aliquid ex ea commodi consequat. Praeterea iter est quasdam res quas ex communi. Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae.",
                      "Phasellus aliquet tortor sit amet justo interdum, at lobortis lorem rhoncus. Donec ut venenatis purus. Morbi at dignissim nunc. Praesent vestibulum eleifend eros nec finibus. Ut enim ad minim veniam, quis nostrud exercitation. Pellentesque habitant morbi tristique senectus et netus. Ullamco laboris nisi ut aliquid ex ea commodi consequat. Praeterea iter est quasdam res quas ex communi. Nihilne te nocturnum praesidium Palati, nihil urbis vigiliae. "
    ]
    
    func font(style: Int) -> UIFont {
        switch style {
        case 1:
            return UIFont(name: "Roboto-Black", size: getFontSize(size: 1))!
        case 2:
            return UIFont(name: "Roboto-Black", size: getFontSize(size: 2))!
        case 3:
            return UIFont(name: "RobotoSlab-Regular", size: getFontSize(size: 3))!
        case 4:
            return UIFont(name: "Roboto-Regular", size: getFontSize(size: 3))!
        case 5:
            return UIFont(name: "Roboto-Black", size: getFontSize(size: 4))!
        case 6:
            return UIFont(name: "Roboto-Black", size: getFontSize(size: 5))!
        case 7:
            return UIFont(name: "Roboto-Black", size: getFontSize(size: 5))!
        default:
            return  UIFont(name: "Roboto-Black", size: 20)!
        }
    }
    
    func getHeightOfBarsOfShit(navigationController: UINavigationController) -> CGFloat {
        return UIApplication.shared.statusBarFrame.height + navigationController.navigationBar.frame.height
    }
    
    let GFXDictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "GFX", ofType: "plist")!)!
    var X1ViewTitleHeigth: CGFloat?
    
    let screenWidth = Double(UIScreen.main.bounds.size.width)
    
    let goldenRatioForCellHeight : Double = 1242/200
    var cellHeight : CGFloat?
    
    let goldenRatioForIcoMenuHeightAndWidth : Double = 414 / 50
    var icoMenuHeightAndWidth: CGFloat?
    
    let goldenRatioForX1ViewTitleHeigth : Double = 414 / 50
    var assetsDictionary: NSDictionary?
    var A11GfxDictionnary: NSDictionary?
    
    let imageSize : Double = 250
    
    override init() {
        super.init()
        cellHeight = CGFloat(screenWidth/goldenRatioForCellHeight)
        icoMenuHeightAndWidth = CGFloat(screenWidth/goldenRatioForIcoMenuHeightAndWidth)
        X1ViewTitleHeigth = CGFloat(screenWidth/goldenRatioForX1ViewTitleHeigth)
        arrayOfMenuText = ["Intro","Aborigenes","Faune","Flore","Randonneés","A faire"]
        //        arrayOfMenuText = ["Intro","Aborigenes"]
        assetsDictionary = GFXDictionary["assets"] as? NSDictionary
        A11GfxDictionnary = assetsDictionary?["A11"] as? NSDictionary
    }
    
    func getImageHeight() -> CGFloat {
        let goldenRatioForImage: Double = 414 / imageSize
        
        
        return CGFloat(screenWidth/goldenRatioForImage)
        
    }
    
    func getFontSize(size: Int) -> CGFloat {
        let goldenRatioForFont : Double?
        
        switch size {
        case 1:
            goldenRatioForFont = 414/30
            return CGFloat(screenWidth/goldenRatioForFont!)
        case 2:
            goldenRatioForFont = 414/25
            return CGFloat(screenWidth/goldenRatioForFont!)
        case 3:
            goldenRatioForFont = 414/17
            return CGFloat(screenWidth/goldenRatioForFont!)
        case 4:
            goldenRatioForFont = 414/14
            return CGFloat(screenWidth/goldenRatioForFont!)
        case 5:
            goldenRatioForFont = 414/50
            return CGFloat(screenWidth/goldenRatioForFont!)
        default:
            goldenRatioForFont = 414/40
            return CGFloat(screenWidth/goldenRatioForFont!)
        }
    }
    
    func getUIColor(index: Int) -> UIColor {
        let colorsArray = GFXDictionary["colors"] as? NSArray
        let colorSelected = colorsArray?[index] as? NSDictionary
        let r = colorSelected?["R"] as! Float
        let g = colorSelected?["G"] as! Float
        let b = colorSelected?["B"] as! Float
        
        return UIColor(colorLiteralRed: r, green: g, blue: b, alpha: 1)
        
    }
    
    func getUiColorArray() -> [UIColor] {
        let colorsArray = GFXDictionary["colors"] as? NSArray
        var array = [UIColor]()
        for color in colorsArray! as NSArray {
            let r = ((color as? NSDictionary)?["R"] as! Float)
            let g = ((color as? NSDictionary)?["G"] as! Float)
            let b = ((color as? NSDictionary)?["B"] as! Float)
            array.append(UIColor(colorLiteralRed: r, green: g, blue: b, alpha: 1))
        }
        return array
    }
    
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName)
            print("Font Names = [\(names)]")
        }
        
        
    }
    
    func colorMyString(string1: String, string2: String, colorOfString1: UIColor, colorOfString2: UIColor, font: UIFont) -> NSMutableAttributedString {
        let result = NSMutableAttributedString()
        let string1Attributes = [NSForegroundColorAttributeName: colorOfString1, NSFontAttributeName: font]
        let string2Attributes = [NSForegroundColorAttributeName: colorOfString2, NSFontAttributeName: font]
        
        let partOne = NSMutableAttributedString(string: string1, attributes: string1Attributes)
        let partTwo = NSMutableAttributedString(string: string2, attributes: string2Attributes)
        
        
        result.append(partOne)
        result.append(partTwo)
        
        return result
    }
    
    func populateMainViewWithA12(mainView: UIView, text: String, topConstraint: CGFloat?) {
        let lastView = mainView.subviews.last
        //        let lastView : UIView? = mainView.subviews[(mainView.subviews.count - 1)]
        let newView = A12(A11text: text)
        mainView.addSubview(newView)
        if let lastView = lastView {
            if let topConstraint = topConstraint {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
            } else {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
            }
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 30).isActive = true
            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        } else {
            newView.pinWith15Margin(to: mainView)
        }
        
    }
    
    func populateMainViewWithA27(mainView: UIView, topConstraint: CGFloat?, bestMonths: [Int]?, arrayOfDataPerMonth: [Double], upperBackgroundColor: UIColor, lineColor: UIColor, bottomBackgroundColor: UIColor, titleColor: UIColor, monthFont: UIFont, monthColor: UIColor, bestMonthsColor: UIColor, titleFont: UIFont, subtitleFont: UIFont, legendColor: UIColor, legendFont: UIFont, graphTitle: String, subtitle: String, months: [String]) {
        let lastView = mainView.subviews.last
        let newView = A27(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200), bestMonths: bestMonths, arrayOfDataPerMonth: arrayOfDataPerMonth, upperBackgroundColor: upperBackgroundColor, lineColor: lineColor, bottomBackgroundColor: bottomBackgroundColor, titleColor: titleColor, monthFont: monthFont, monthColor: monthColor, bestMonthsColor: bestMonthsColor, titleFont: titleFont, subtitleFont: subtitleFont, legendColor: legendColor, legendFont: legendFont, graphTitle: graphTitle, subtitle: subtitle, months: months)
        mainView.addSubview(newView)
        if let lastView = lastView {
            if let topConstraint = topConstraint {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
            } else {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
            }
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
            newView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        } else {
            newView.pinWith15Margin(to: mainView)
        }
        
    }
    
    func populateMainViewWithA19(mainView: UIView, topConstraint: CGFloat?, title: String?, text: String) {
        let lastView = mainView.subviews.last
        let newView = A19(labelText: text, titleText: title!)
        mainView.addSubview(newView)
        if let lastView = lastView {
            if let topConstraint = topConstraint {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
            } else {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
            }
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
            newView.heightAnchor.constraint(equalToConstant: newView.totalHeight!).isActive = true
        } else {
            newView.pinWith15Margin(to: mainView)
        }
        
    }
    
    func populateMainViewWithA24(mainView: UIView, topConstraint: CGFloat?, title: String, text: String) {
        let lastView = mainView.subviews.last
        let newView = A24(labelText: text, titleText: title)
        mainView.addSubview(newView)
        if let lastView = lastView {
            if let topConstraint = topConstraint {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
            } else {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
            }
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
            newView.heightAnchor.constraint(equalToConstant: newView.totalHeight!).isActive = true
        } else {
            newView.pinWith15Margin(to: mainView)
        }
        
    }
    
    func populateMainViewWithA26(mainView: UIView, topConstraint: CGFloat?) {
        let lastView = mainView.subviews.last
        let newView = A26View()
        mainView.addSubview(newView)
        if let lastView = lastView {
            if let topConstraint = topConstraint {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
            } else {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
            }
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
            newView.heightAnchor.constraint(equalToConstant: newView.textViewHeight + getImageHeight() + 8+newView.heightOfMap+15).isActive = true
        } else {
            newView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
            newView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0).isActive = true
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.heightAnchor.constraint(equalToConstant: newView.textViewHeight+getImageHeight()+8+newView.heightOfMap+15).isActive = true
        }
    }
    
    func populateMainViewWithA17(mainView: UIView, topConstraint: CGFloat?, extinctIndex: Int) {
        let lastView = mainView.subviews.last
        let newView = A17(extinctIndex: extinctIndex)
        mainView.addSubview(newView)
        if let lastView = lastView {
            if let topConstraint = topConstraint {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
            } else {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
            }
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
            newView.heightAnchor.constraint(equalToConstant: newView.totalHeight!).isActive = true
        } else {
            newView.pinWith15Margin(to: mainView)
        }
        
    }
    
    func populateMainViewWithA28(mainView: UIView, topConstraint: CGFloat?) {
        let lastView = mainView.subviews.last
        let newView = A28View()
        mainView.addSubview(newView)
        if let lastView = lastView {
            if let topConstraint = topConstraint {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
            } else {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
            }
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
            newView.heightAnchor.constraint(equalToConstant: newView.totalHeightArray.max()! + getImageHeight() + 8).isActive = true
        } else {
            newView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
            newView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0).isActive = true
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.heightAnchor.constraint(equalToConstant: newView.totalHeightArray.max()! + getImageHeight() + 8).isActive = true
        }
    }
    
    func populateMainViewWithA29(mainView: UIView, topConstraint: CGFloat?) {
        let lastView = mainView.subviews.last
        let newView = A29View()
        mainView.addSubview(newView)
        if let lastView = lastView {
            if let topConstraint = topConstraint {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
            } else {
                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
            }
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
            newView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height - (delegate.rootVC?.navigationController?.navigationBar.frame.size.height)! - X1ViewTitleHeigth!).isActive = true
        } else {
            newView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
            newView.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0).isActive = true
            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            newView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height - (delegate.rootVC?.navigationController?.navigationBar.frame.size.height)! - X1ViewTitleHeigth!).isActive = true
        }
        
        
    }
    
//    func populateMainViewWithA30(mainView: UIView, topConstraint: CGFloat?, text: String, color: UIColor) {
//        let lastView = mainView.subviews.last
//        var newView = A30View(colorLabelBackground: .black, textLabel: "test")
//        
//        mainView.addSubview(newView)
//
//        if let lastView = lastView {
//            if let topConstraint = topConstraint {
//                newView.topAnchor
//            }
//        }
    
//        if let lastView = lastView {
//            print(lastView)
//            if let topConstraint = topConstraint {
//                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: topConstraint).isActive = true
//            } else {
//                newView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 15).isActive = true
//            }
//            newView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 30).isActive = true
//            newView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
//        } else {
//            newView.pinWith15Margin(to: mainView)
//        }
//        
//    }
}
