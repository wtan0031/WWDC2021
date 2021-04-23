import UIKit
import PlaygroundSupport

public class AnalyseGrowth: UIViewController{
    
    var val1 = 0.0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewLoadSetup()
    }
    
    func viewLoadSetup() {
        // Setup View
        let view = UIView()
        
        view.backgroundColor = .black
        
        var titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "CAGR Analysis", size: 70, color: .customGreen)
        
        var titleLogo = Custom.setupLabel(frame: CGRect(x: 570, y: 0, width: 100, height: 50), text: "🧐", size: 90, color: .green)
        
        var cagrLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 160, width: 250, height: 60), text: "CAGR(%)", size: 42, color: .green)
        
        var companyLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 790, width: 250, height: 60), text: "Company A : \(val1)", size: 42, color: .green)
        
        var gradeLabel = Custom.setupLabel(frame: CGRect(x: 460, y: 160, width: 350, height: 60), text: "Analysis", size: 42, color: .green)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 240, width: 250, height: 60))
        introLabel.text = """
    1 - 5


    6 - 9


    10 - 14


    15 >
    """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let detailsLabel = UILabel(frame: CGRect(x: 302, y: 240, width: 500, height: 500))
        detailsLabel.text = """
    NORMAL, the business has a small growth over the years.


    GOOD, the business is expanding and the sign shows positive growth over the years.


    VERY GOOD, there is a sign of big growth, the business is growing and doing great over the years.


    EXCELLENT, this is a sign of exploding growth of the business, it meets the demand of the market and it suits the current market trend.
    """
        detailsLabel.textColor = .white
        detailsLabel.font = UIFont(name: "Noteworthy-Bold", size: 22)
        detailsLabel.numberOfLines = 0
        detailsLabel.sizeToFit()
        
        let nextButton = Custom.setupButton(title: "Dividend   --->", width: 140, colours: [UIColor.customBabyblue.cgColor,UIColor.blue.cgColor])
        nextButton.frame.origin.x = 620
        nextButton.frame.origin.y = 810
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        
        view.addSubview(titleLabel)
        view.addSubview(titleLogo)
        view.addSubview(introLabel)
        view.addSubview(cagrLabel)
        view.addSubview(nextButton)
        view.addSubview(gradeLabel)
        view.addSubview(detailsLabel)
        view.addSubview(companyLabel)
        
        self.view = view
    }
    
    @objc func nextVC() {
        let vc = Dividend()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
