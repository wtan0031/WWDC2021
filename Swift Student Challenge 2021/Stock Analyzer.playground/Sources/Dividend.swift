
import UIKit
import PlaygroundSupport

public class Dividend: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        let view = UIView()
        view.backgroundColor = .black
        
        let titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "Dividend", size: 75, color: .customMayaBlue)
        
        let titleLogo = Custom.setupLabel(frame: CGRect(x: 382, y: 20, width: 100, height: 50), text: "(%)", size: 80, color: .customMayaBlue)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 180, width: 650, height: 60))
        introLabel.text = """
                          Companies that can distribute dividend to the shareholders normally have a strong and stable cash flow, state of financial position is strong enough to withstand the economic crisis.

                          Get the latest dividend distributed by the company and divide it by the latest price of the stock and we will get
                          """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let cagrLabel = Custom.setupLabel(frame: CGRect(x: 172, y: 520, width: 650, height: 60), text: "Dividend Yield (%).", size: 50, color: .customBabyblue)
        
        let nextButton = Custom.setupButton(title: "Learn More", width: 140, colours: [UIColor.customBabyblue.cgColor,UIColor.blue.cgColor])
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
        let vc = CalDivd()
        navigationController?.pushViewController(vc, animated: true)
    }
}

