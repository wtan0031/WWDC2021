import UIKit
import PlaygroundSupport

public class Summary: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup View
        let view = UIView()
        view.backgroundColor = .black
        
        var titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "Summary", size: 48, color: .customPurple)
        
        var logoLabel = Custom.setupLabel(frame: CGRect(x: 282, y: 0, width: 20, height: 50), text: "🎬🎬🎬", size: 60, color: .white)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 130, width: 650, height: 100))
        introLabel.text = """
                          You have learned 3 new things today !!!

                                  - Compound Annnual Growth Rate 📈
                                  - Dividend Yield (%) 💰
                                  - Price Earning Ratio 💵

                          I hope this knowledge would help you make more accurate decisions when comes to investing in the stock market. Now you are on the right track to creating your wealth!

                          Thank you for viewing my Playground.
                          Wei Liang. ☺️
                          
                          """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 35)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        view.addSubview(introLabel)
        view.addSubview(logoLabel)
        view.addSubview(titleLabel)
        
        self.view = view
        
    }
    
}
