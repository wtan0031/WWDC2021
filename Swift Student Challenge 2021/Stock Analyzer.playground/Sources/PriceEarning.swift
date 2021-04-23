import UIKit
import PlaygroundSupport

public class PriceEarning: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        let view = UIView()
        view.backgroundColor = .black
        
        let titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "Price Earning Ratio", size: 55, color: .customOrangeRed)
        
        let titleLogo = Custom.setupLabel(frame: CGRect(x: 562, y: 20, width: 100, height: 50), text: "💵💵💵", size: 60, color: .customOrangeRed)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 120, width: 650, height: 50))
        introLabel.text = """
                          It is also important to analyse the current stock price and should be compared to other stock in its sector or industry group.

                          If the price is overvalued, there is a high chance that the price of the stock won't be rising but having a higher chance to fall 📉.
                          
                          Whereas, if the stock is undervalued and the financial position and the future prospect is good, there is a chance where the price of the stock may rise 📈.

                          This calculation is known as 
                          """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 29)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let cagrLabel = Custom.setupLabel(frame: CGRect(x: 442, y: 650, width: 650, height: 60), text: "P/E Ratio !!!", size: 60, color: .customYellow)
        
        let nextButton = Custom.setupButton(title: "Learn More", width: 140, colours: [UIColor.customYellow.cgColor,UIColor.customOrangeRed.cgColor])
        nextButton.frame.origin.x = 52
        nextButton.frame.origin.x = 332
        nextButton.frame.origin.y = 800
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(titleLogo)
        view.addSubview(introLabel)
        view.addSubview(cagrLabel)
        view.addSubview(nextButton)
        
        self.view = view
    }
    
    @objc func nextPressed() {
        let vc = CalPe()
        navigationController?.pushViewController(vc, animated: true)
    }
}

