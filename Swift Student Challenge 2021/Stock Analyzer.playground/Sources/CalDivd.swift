
import UIKit
import PlaygroundSupport

public class CalDivd: UIViewController{
    
    var val1 = 0
    var val2 = 0
    var resultFalse = "Error"
    var finalOutput = 0.0
    
    var input1 : UITextField = UITextField()
    var input2 : UITextField = UITextField()
    var outputLabel : UILabel = UILabel()
    var resultLabelTrue : UILabel = UILabel()
    var resultLabelFalse : UILabel = UILabel()
    var nextButton : UIButton = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewLoadSetup()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewLoadSetup()
    }
    
    func viewLoadSetup() {
        // Setup View
        let view = UIView()
        
        view.backgroundColor = .black
        
        var titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "Hands On", size: 75, color: .customMayaBlue)
        
        var titleLogo = Custom.setupLabel(frame: CGRect(x: 422, y: 0, width: 100, height: 50), text: "📝", size: 90, color: .green)
        
        var cagrLabel = Custom.setupLabel(frame: CGRect(x: 460, y: 250, width: 350, height: 60), text: " D/Y(%) Calculator", size: 35, color: .customBabyblue)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 180, width: 250, height: 60))
        introLabel.text = """
    Eg. Company  A
    
    2020
    - Latest Dividend (2020) : $0.575
    
    Latest
    - Price of the stock : $35
    
    """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let calButton = Custom.setupButton(title: "Calculate", width: 140, colours: [UIColor.customBabyblue.cgColor,UIColor.blue.cgColor])
        calButton.frame.origin.x = 530
        calButton.frame.origin.y = 650
        calButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        calButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        nextButton = Custom.setupButton(title: "Next", width: 80, colours: [UIColor.customBabyblue.cgColor,UIColor.blue.cgColor])
        nextButton.frame.origin.x = 700
        nextButton.frame.origin.y = 780
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        nextButton.isHidden = true
        
        input1 = Custom.setupTextField(frame: CGRect(x: 430, y: 350, width: 300, height: 100), placeholder: "Please Insert The Latest Dividend($)")
        
        input2 = Custom.setupTextField(frame: CGRect(x: 430, y: 500, width: 300, height: 100), placeholder: "Please Insert The Share Price($)")
        
        outputLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 750, width: 350, height: 60), text: "Dividend Yield is ", size: 44, color: .customBabyblue)
        
        resultLabelTrue = Custom.setupLabel(frame: CGRect(x: 370, y: 730, width: 350, height: 60), text: "testing...........", size: 56, color: .customBabyblue)
        resultLabelTrue.numberOfLines = 0
        
        resultLabelFalse = Custom.setupLabel(frame: CGRect(x: 52, y: 750, width: 350, height: 60), text: "Error, Please Enter Positive Numbers Only", size: 35, color: .red)
        
        outputLabel.isHidden = true
        resultLabelTrue.isHidden = true
        resultLabelFalse.isHidden = true
        
        view.addSubview(titleLabel)
        view.addSubview(titleLogo)
        view.addSubview(introLabel)
        view.addSubview(cagrLabel)
        view.addSubview(input1)
        view.addSubview(input2)
        view.addSubview(calButton)
        view.addSubview(nextButton)
        view.addSubview(outputLabel)
        view.addSubview(resultLabelTrue)
        view.addSubview(resultLabelFalse)
        
        self.view = view
    }
    
    @objc func nextVC() {
        let vc = AnalyseDivd()
        vc.val1 = finalOutput
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func nextPressed() {
        var num1 = Double(input1.text!) ?? 0
        var num2 = Double(input2.text!) ?? 0
        if num1 == 0 || num2 == 0 || num1 < 0 || num2 < 0 {
            print("Error")
            resultLabelFalse.isHidden = false
            outputLabel.isHidden = true
            resultLabelTrue.isHidden = true
        } else {
            calPressed(val1: num1, val2: num2)
            outputLabel.isHidden = false
            resultLabelTrue.isHidden = false
            resultLabelFalse.isHidden = true
            nextButton.isHidden = false
        }
    }
    
    @objc func calPressed(val1: Double, val2: Double) {
        var value1 = Double(val1) / Double(val2)
        value1 = value1 * 100
        let y = Double(round(value1*1000)/1000)
        resultLabelTrue.text = "\(y)%"
        finalOutput = y
    }
}
