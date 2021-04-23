import UIKit
import PlaygroundSupport

public class AnalysePe: UIViewController{
    
    var val1 = 0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewLoadSetup()
    }
    
    func viewLoadSetup() {
        // Setup View
        let view = UIView()
        
        view.backgroundColor = .black
        
        var titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "P/E Ratio Analysis", size: 62, color: .customOrangeRed)
        
        var titleLogo = Custom.setupLabel(frame: CGRect(x: 570, y: 0, width: 100, height: 50), text: "🧐", size: 90, color: .customOrangeRed)
        
        var cagrLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 160, width: 250, height: 60), text: "P/E (times)", size: 42, color: .customYellow)
        
        var companyLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 790, width: 250, height: 60), text: "Company A : \(val1) times", size: 42, color: .customYellow)
        
        let noteLabel = UILabel(frame: CGRect(x: 52, y: 705, width: 680, height: 60))
        noteLabel.text = "Note: You should compare to other stock in its sector or industry group to get an accurate P/E analysis! Above values are a reference to a certain sector."
        noteLabel.textColor = .yellow
        noteLabel.font = UIFont(name: "Noteworthy-Bold", size: 20)
        noteLabel.numberOfLines = 0
        noteLabel.sizeToFit()
        
        var gradeLabel = Custom.setupLabel(frame: CGRect(x: 460, y: 160, width: 350, height: 60), text: "Analysis", size: 42, color: .customYellow)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 240, width: 250, height: 60))
        introLabel.text = """
    25 >


    10 - 24



    < 9
    """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let detailsLabel = UILabel(frame: CGRect(x: 302, y: 240, width: 500, height: 500))
        detailsLabel.text = """
    The stock is over-valued, or the investors are expecting high growth rates in the future. Have to be cautious with high P/E stock.

    The ratio is considred normal. If the ratio is higher when compared to its competitors, it indicates that this business might have high confidence from the investors and they expecting growth rates in the future as well.

    A low P/E might indicate that the current stock price is low relative to earnings. Have to be cautious with low P/E stock.
    """
        detailsLabel.textColor = .white
        detailsLabel.font = UIFont(name: "Noteworthy-Bold", size: 22)
        detailsLabel.numberOfLines = 0
        detailsLabel.sizeToFit()
        
        let nextButton = Custom.setupButton(title: "Summary", width: 150, colours: [UIColor.systemPink.cgColor,UIColor.blue.cgColor])
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
        view.addSubview(noteLabel)
        
        self.view = view
    }
    
    @objc func nextVC() {
        let vc = Summary()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
