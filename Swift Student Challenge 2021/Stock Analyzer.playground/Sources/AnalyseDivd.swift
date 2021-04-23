import UIKit
import PlaygroundSupport

public class AnalyseDivd: UIViewController{
    
    var val1 = 0.0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewLoadSetup()
    }
    
    func viewLoadSetup() {
        // Setup View
        let view = UIView()
        
        view.backgroundColor = .black
        
        var titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "Dividend Analysis", size: 62, color: .customMayaBlue)
        
        var titleLogo = Custom.setupLabel(frame: CGRect(x: 570, y: 0, width: 100, height: 50), text: "🧐", size: 90, color: .green)
        
        var cagrLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 160, width: 250, height: 60), text: "D/Y (%)", size: 42, color: .customMayaBlue)
        
        var companyLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 790, width: 250, height: 60), text: "Company A : \(val1)%", size: 42, color: .customBabyblue)
        
        var gradeLabel = Custom.setupLabel(frame: CGRect(x: 460, y: 160, width: 350, height: 60), text: "Analysis", size: 42, color: .customMayaBlue)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 240, width: 250, height: 60))
        introLabel.text = """
    1 - 2


    3 - 4


    5 - 6


    7 >
    """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let detailsLabel = UILabel(frame: CGRect(x: 302, y: 240, width: 500, height: 500))
        detailsLabel.text = """
    NORMAL, the business pays a little dividend income, this indicates the business might be using the profit to reinvest itself.

    GOOD, the business pays a slightly higher dividend income. Good sign of increases in the profit.


    VERY GOOD, there are good chances of appreciation in the market value of the business's stock.


    EXCELLENT, very high dividend income, normally old and well established company able to pay this much !
    """
        detailsLabel.textColor = .white
        detailsLabel.font = UIFont(name: "Noteworthy-Bold", size: 22)
        detailsLabel.numberOfLines = 0
        detailsLabel.sizeToFit()
        
        let nextButton = Custom.setupButton(title: "P/E Ratio  --->", width: 150, colours: [UIColor.customYellow.cgColor,UIColor.customOrangeRed.cgColor])
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
        let vc = PriceEarning()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
