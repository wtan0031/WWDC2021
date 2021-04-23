import UIKit
import PlaygroundSupport

public class Growth: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        let view = UIView()
        view.backgroundColor = .black
        
        let titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "Growth", size: 75, color: .customGreen)
        
        let titleLogo = Custom.setupLabel(frame: CGRect(x: 302, y: 0, width: 100, height: 50), text: "📈", size: 75, color: .green)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 180, width: 650, height: 60))
        introLabel.text = """
                          Is there any growth in the business of the company? 

                          The easiest way to find out is to get the profit after tax  (PAT) of the company at the end of the particular financial year. Take the value of the current year and compare it with the value from 5 years.

                          Calculate the change in (%) you will know how fast is the company growing compared to 5 years ago.

                          This calculation is also known as 
                          """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let cagrLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 750, width: 650, height: 60), text: "Compound Annual Growth Rate (CAGR).", size: 32, color: .green)
        
        let nextButton = Custom.setupButton(title: "Learn More", width: 140, colours: [UIColor.customDarkGreen.cgColor,UIColor.systemGreen.cgColor])
        nextButton.frame.origin.x = 332
        nextButton.frame.origin.y = 820
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
        let vc = CalGrowth()
        navigationController?.pushViewController(vc, animated: true)
    }
}
