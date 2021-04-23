import UIKit
import PlaygroundSupport

public class Introduction: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        let view = UIView()
        view.backgroundColor = .black
        
        var titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "Introduction", size: 62, color: .customPurple)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 130, width: 650, height: 100))
        introLabel.text = """
                          After the stock market crash 📉 in 2020 thanks to COVID-19 🦠, and the incident of Gamestop Stock📈, more and more people start participating in investing.

                          Most of them have no prior experience or know what to look for from a good company hence most of them saw the value of their portfolio started to depreciating once they have invested in the company.

                          This Playground is a quick introduction to get to know the financial status of the company.
                          
                          """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let nextButton = Custom.setupButton(title: "Begin", width: 140, colours: [UIColor.systemPink.cgColor,UIColor.blue.cgColor])
        nextButton.frame.origin.x = 332
        nextButton.frame.origin.y = 800
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(introLabel)
        view.addSubview(nextButton)
        self.view = view
        
    }
    
    @objc func nextPressed() {
        let vc = Growth()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
