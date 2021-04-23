
import Foundation
import UIKit

public class Custom {
    
    //Setup the custom button
    public class func setupButton(title: String, width: Int, colours: [CGColor]) -> UIButton {
        let button = GradientButton(colors: colours)
        button.frame = CGRect(x: 510, y: 140 , width: width, height: 35)
        button.setTitle(title, for: .normal)
        button.titleLabel!.font = UIFont(name: "Noteworthy-Bold", size: 20)
        button.transform = CGAffineTransform(scaleX: 1, y: -1)
        return button
        
    }
    
    //Setup the custom text field
    public class func setupTextField(frame: CGRect, placeholder: String) -> UITextField {
        let input = UITextField.init(frame: frame)
        input.layer.borderColor = UIColor.white.cgColor
        input.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)])
        input.textAlignment = .center
        input.layer.borderWidth = 2.0
        input.textColor = .green
        input.backgroundColor = .black
        input.keyboardType = .numberPad
        
        return input
    }
    
    //Setup the custom label
    public class func setupLabel(frame: CGRect, text: String, size: Int, color : UIColor) -> UILabel {
        let label = UILabel.init(frame: frame)
        label.text = text
        label.textColor = color
        label.font = UIFont(name: "Noteworthy-Bold", size: CGFloat(size))
        label.sizeToFit()
        return label
    }
    
    
}

class GradientButton: UIButton {
    
    let gradient = CAGradientLayer()
    init(colors: [CGColor]) {
        super.init(frame: .zero)
        gradient.frame = bounds
        gradient.colors = colors
        gradient.cornerRadius = 10
        layer.addSublayer(gradient)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
}

