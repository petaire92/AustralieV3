import UIKit

class A19: UIView {
    var totalHeight: CGFloat?
    
    let titleLabel : UILabel? = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(labelText: String, titleText: String?) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
        let gfx = Gfx()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = gfx.getUIColor(index: 9)
        titleLabel?.font = gfx.font(style: 2)
        textLabel.font = gfx.font(style: 4)
        if let titleText = titleText {
            titleLabel?.text = titleText
            addSubview(titleLabel!)
            titleLabel!.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
            titleLabel!.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
            titleLabel!.sizeToFit()
            addSubview(textLabel)
            textLabel.text = labelText
            textLabel.topAnchor.constraint(equalTo: (titleLabel?.bottomAnchor)!, constant: 10).isActive = true
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
            textLabel.widthAnchor.constraint(equalToConstant: frame.size.width - 20).isActive = true
            textLabel.lineBreakMode = .byWordWrapping
            textLabel.sizeToFit()
            layoutIfNeeded()
            totalHeight = (titleLabel?.frame.size.height)! + 10 + textLabel.frame.size.height + 20
            
        } else {
            addSubview(textLabel)
            textLabel.text = labelText
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
            
            textLabel.widthAnchor.constraint(equalToConstant: frame.size.width - 20).isActive = true
            textLabel.lineBreakMode = .byWordWrapping
            textLabel.sizeToFit()
            layoutIfNeeded()
            totalHeight = textLabel.frame.size.height + 20
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
