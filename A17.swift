import UIKit

class A17: UIView {
    var totalHeight: CGFloat?
    var extinctCategories: [String]?
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
    
    let survivingText = ["Ne remplit pas les critères d'une catégorie en danger. Les animaux répandus et abondants appartiennent à cette catégorie.", "Probabilité d'être en danger dans un futur proche.", "Haut risque de mise en danger.", "Haut risque d'extinction dans la nature.", "Risque d'extinction dans la nature extrêmement élevé.", "Aucun individu survivant connu." ]

    var extinctIndex: Int?
    
    init(extinctIndex: Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
        self.extinctIndex = extinctIndex
        let gfx = Gfx()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = gfx.getUIColor(index: 9)
        titleLabel?.font = gfx.font(style: 2)
        textLabel.font = gfx.font(style: 4)
        titleLabel?.text = "Statut de conservation"
        addSubview(titleLabel!)
        titleLabel!.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel!.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        titleLabel!.sizeToFit()
        addSubview(textLabel)
        textLabel.text = survivingText[extinctIndex]
        textLabel.topAnchor.constraint(equalTo: (titleLabel?.bottomAnchor)!, constant: 10).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: frame.size.width - 20).isActive = true
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.sizeToFit()
        layoutIfNeeded()
        
        let extinctStackView : UIStackView = {
            let sv = UIStackView()
            sv.axis = .horizontal
            sv.distribution = .fillEqually
            sv.alignment = .fill
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.heightAnchor.constraint(equalToConstant: 15).isActive = true
            sv.backgroundColor = .gray
            return sv
        }()
        
        addSubview(extinctStackView)
        extinctStackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 15).isActive = true
        extinctStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        extinctStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        let colorsExtinct = [UIColor(red:0.00, green:0.73, blue:0.43, alpha:1.00), UIColor(red:0.95, green:0.92, blue:0.61, alpha:1.00),UIColor(red:0.94, green:0.91, blue:0.48, alpha:1.00),UIColor(red:1.00, green:0.71, blue:0.00, alpha:1.00),UIColor(red:1.00, green:0.30, blue:0.30, alpha:1.00),UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.00)]
        var compteur = 0
        for _ in survivingText {
            
            let _ : UIView = {
                let view = UIView()
                view.alpha = 0.2
                if compteur == extinctIndex {
                    view.alpha = 1
                }
                view.backgroundColor = colorsExtinct[compteur]
                view.translatesAutoresizingMaskIntoConstraints = false
                view.heightAnchor.constraint(equalToConstant: 5).isActive = true
                view.widthAnchor.constraint(equalToConstant: frame.size.width / 6).isActive = true
                extinctStackView.addArrangedSubview(view)
                return view
            }()
            compteur += 1
        }
//
        extinctStackView.layoutIfNeeded()
        
        totalHeight = (titleLabel?.frame.size.height)! + 10 + textLabel.frame.size.height + 20 + extinctStackView.frame.size.height + 15

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



