
import UIKit

class A27: UIView {
        
        var arrayOfDataPerMonth: [Double]?
        var months: [String]?
        var goldenRatioForData: CGFloat?
        var goldenRationForMonth: CGFloat?
        var monthStackView: UIStackView?
        var bestMonths: [Int]?
        var upperBackgroundColor: UIColor?
        var lineColor: UIColor?
        var bottomBackgroundColor: UIColor?
        var bestMonthsColor: UIColor?
        var titleFont: UIFont?
        var subtitleFont: UIFont?
        var monthFont: UIFont?
        var legendFont: UIFont?
        var legendColor: UIColor?
        var monthColor: UIColor?
        var graphTitle: String?
        var subtitle: String?
        var titleColor: UIColor?
        
    init(frame: CGRect, bestMonths: [Int]?, arrayOfDataPerMonth: [Double], upperBackgroundColor: UIColor, lineColor: UIColor, bottomBackgroundColor: UIColor, titleColor: UIColor, monthFont: UIFont, monthColor: UIColor, bestMonthsColor: UIColor, titleFont: UIFont, subtitleFont: UIFont, legendColor: UIColor, legendFont: UIFont, graphTitle: String, subtitle: String, months: [String]) {
            super.init(frame: frame)
            self.arrayOfDataPerMonth = arrayOfDataPerMonth
            self.bestMonths = bestMonths
            self.backgroundColor = upperBackgroundColor
            self.lineColor = lineColor
            self.bottomBackgroundColor = bottomBackgroundColor
            self.titleFont = titleFont
            self.subtitleFont = subtitleFont
            self.graphTitle = graphTitle
            self.subtitle = subtitle
            self.titleColor = titleColor
            self.bestMonthsColor = bestMonthsColor
            self.monthFont = monthFont
            self.monthColor = monthColor
            self.legendColor = legendColor
            self.legendFont = legendFont
//            let moyenne : CGFloat = CGFloat((arrayOfDataPerMonth.max()! - arrayOfDataPerMonth.min()!) / 2)
            self.goldenRatioForData = (frame.size.height / 2) / CGFloat(arrayOfDataPerMonth.max()!)
            self.goldenRationForMonth = frame.size.width / CGFloat((self.arrayOfDataPerMonth?.count)!)
            self.months = months
            self.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func draw(_ rect: CGRect) {
            let _ : CGFloat = 30
            let maxValue = arrayOfDataPerMonth?.max()
            let minValue = arrayOfDataPerMonth?.min()
            let context = UIGraphicsGetCurrentContext()!
            let backgroundView = UIBezierPath(rect: CGRect(x: frame.size.width, y: frame.size.height, width: 1, height: 1))
            let secondPoint = CGPoint(x: 0, y: frame.size.height)
            let thirdPointData = getY(y: (arrayOfDataPerMonth?[(arrayOfDataPerMonth?.count)! - 1])!)
            let thirdPoint = CGPoint(x: 0, y: thirdPointData)
            var arrayOfPoint: [CGPoint] = [thirdPoint]
            context.saveGState()
            
            let line = UIBezierPath(rect: CGRect(x: -10, y: thirdPointData, width: 0, height: 0))
//            let firstBestPoint = arrayOfPoint[(bestMonths?[0])! - 1]
            line.addLine(to: CGPoint(x: 0, y: thirdPointData))
            var countLine = 1
            
            lineColor?.setStroke()

            
            while countLine <= (arrayOfDataPerMonth?.count)! {
                
                let x = CGFloat(countLine) * goldenRationForMonth!
                let y = getY(y: (arrayOfDataPerMonth?[countLine - 1])!)
                let point = CGPoint(x: x, y: y)
                arrayOfPoint.append(point)
                line.addLine(to: point)
                
                countLine += 1
            }
            line.lineWidth = 6
            line.stroke()
            
            context.saveGState()
            context.restoreGState()
            
            
            // On dessine le background
            

            backgroundView.addLine(to: secondPoint)
            backgroundView.addLine(to: thirdPoint)
            var countBG = 1
            
            while countBG <= (arrayOfDataPerMonth?.count)! {
                
                let x = CGFloat(countBG) * goldenRationForMonth!
                let y = getY(y: (arrayOfDataPerMonth?[countBG - 1])!)
                let point = CGPoint(x: x, y: y)
                backgroundView.addLine(to: point)
                
                if arrayOfDataPerMonth?[countBG - 1] == maxValue || arrayOfDataPerMonth?[countBG - 1] == minValue {
                    let circlePath = UIBezierPath(arcCenter: point, radius: CGFloat(5), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
                    
                    let shapeLayer = CAShapeLayer()
                    shapeLayer.path = circlePath.cgPath
                    
                    //change the fill color
                    shapeLayer.fillColor = UIColor.white.cgColor
                    //you can change the stroke color
                    shapeLayer.strokeColor = UIColor.black.cgColor
                    //you can change the line width
                    shapeLayer.lineWidth = 2.0
                    
                    self.layer.addSublayer(shapeLayer)
                    drawMyText(myText: "\(arrayOfDataPerMonth![countBG - 1])", textColor: titleColor!, FontName: (legendFont?.fontName)!, FontSize: (legendFont?.pointSize)!, inRect: CGRect(x: point.x - 10, y: point.y - 22, width: 50, height: 50))
                }
                
                countBG += 1
            }
            UIColor.white.setFill()
            backgroundView.fill()
            
            // On dessine le trait


            
            
            var monthCompteur = 0
            while monthCompteur < (months?.count)! {
                let goldenRatioColumnsMonths = ((self.frame.size.width / CGFloat((months?.count)!)) * CGFloat(monthCompteur))
                let isBest = (bestMonths?.contains(monthCompteur + 1))! ? true : false
                drawMyText(myText: months![monthCompteur], textColor: isBest ? .green : monthColor!, FontName: (monthFont?.fontName)!, FontSize: (monthFont?.pointSize)!, inRect: CGRect(x: goldenRatioColumnsMonths + ((self.frame.size.width / CGFloat((self.months?.count)!)) / 2), y: self.frame.size.height - 20, width: self.frame.size.width, height: self.frame.size.height))
                monthCompteur += 1
            }
            
            
            drawMyText(myText: graphTitle!.uppercased(), textColor: titleColor!, FontName: (titleFont?.fontName)!, FontSize: (titleFont?.pointSize)!, inRect: CGRect(x: 10, y: 10, width: self.frame.size.width, height: self.frame.size.height))
            drawMyText(myText: subtitle!, textColor: titleColor!, FontName: (subtitleFont?.fontName)!, FontSize: (subtitleFont?.pointSize)!, inRect: CGRect(x: 10, y: 30, width: self.frame.size.width, height: self.frame.size.height))
            
            
            
            context.restoreGState()
            
            
        }
        
        
        
        func getY(y: Double) -> CGFloat {
            var yToReturn : CGFloat = 0
            yToReturn = (frame.size.height - (CGFloat(y) * self.goldenRatioForData!)) - 50
            return yToReturn
        }
        
        
        
        func drawMyText(myText:String,textColor:UIColor, FontName:String, FontSize:CGFloat, inRect:CGRect){
            let textFont = UIFont(name: FontName, size: FontSize)!
            let textFontAttributes = [
                NSFontAttributeName: textFont,
                NSForegroundColorAttributeName: textColor,
                ] as [String : Any]
            
            myText.draw(in: inRect, withAttributes: textFontAttributes)
        }
        
        
    
    
    
}
