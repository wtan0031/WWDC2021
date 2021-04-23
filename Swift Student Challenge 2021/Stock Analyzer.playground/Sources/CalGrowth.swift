import UIKit
import PlaygroundSupport

public class CalGrowth: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var smallDict:[String:Int] = ["Thousand":1000, "Million":1000000, "Billion":1000000000, "Trillion":1000000000000]
    let placeValue1 = ["Thousand", "Million", "Billion", "Trillion"]
    var value1 = "Thousand"
    var value2 = "Thousand"
    var val1 = 0
    var val2 = 0
    var finalOutput = 0.0
    var resultFalse = "Error"
    
    let pickView1 = UIPickerView(frame:  CGRect(x: 662, y: 350, width: 140, height: 100))
    
    let pickView2 = UIPickerView(frame:  CGRect(x: 662, y: 500, width: 140, height: 100))
    
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
        pickView1.delegate = self
        pickView1.dataSource = self
        pickView1.tag = 1
        pickView2.delegate = self
        pickView2.dataSource = self
        pickView2.tag = 2
        
        var titleLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 25, width: 20, height: 50), text: "Hands On", size: 75, color: .customGreen)
        
        var titleLogo = Custom.setupLabel(frame: CGRect(x: 422, y: 0, width: 100, height: 50), text: "📝", size: 90, color: .green)
        
        var cagrLabel = Custom.setupLabel(frame: CGRect(x: 430, y: 250, width: 350, height: 60), text: "CAGR Calculator", size: 35, color: .green)
        
        let introLabel = UILabel(frame: CGRect(x: 52, y: 180, width: 250, height: 60))
        introLabel.text = """
    Eg. Company  A
    
    2016
    - Profit After Tax (PAT) : 259 million
    
    2020
    - Profit After Tax (PAT) : 385 million
    
    """
        introLabel.textColor = .white
        introLabel.font = UIFont(name: "Noteworthy-Bold", size: 30)
        introLabel.numberOfLines = 0
        introLabel.sizeToFit()
        
        let calButton = Custom.setupButton(title: "Calculate", width: 140, colours: [UIColor.customDarkGreen.cgColor,UIColor.customGreen.cgColor])
        calButton.frame.origin.x = 460
        calButton.frame.origin.y = 650
        calButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
        calButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        
        nextButton = Custom.setupButton(title: "Next", width: 80, colours: [UIColor.customDarkGreen.cgColor,UIColor.customGreen.cgColor])
        nextButton.frame.origin.x = 700
        nextButton.frame.origin.y = 780
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        nextButton.isHidden = true
        
        input1 = Custom.setupTextField(frame: CGRect(x: 362, y: 350, width: 300, height: 100), placeholder: "Please Insert The PAT (5 years ago)")
        
        input2 = Custom.setupTextField(frame: CGRect(x: 362, y: 500, width: 300, height: 100), placeholder: "Please Insert The PAT (Current)")
        
        outputLabel = Custom.setupLabel(frame: CGRect(x: 52, y: 700, width: 350, height: 60), text: "Compound Annual Growth Rate is ", size: 38, color: .green)
        
        resultLabelTrue = Custom.setupLabel(frame: CGRect(x: 250, y: 750, width: 350, height: 60), text: "testing...........", size: 55, color: .green)
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
        view.addSubview(pickView1)
        view.addSubview(pickView2) 
        view.addSubview(calButton)
        view.addSubview(nextButton)
        view.addSubview(outputLabel)
        view.addSubview(resultLabelTrue)
        view.addSubview(resultLabelFalse)
        
        self.view = view
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return placeValue1.count
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return placeValue1[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            value1 = self.placeValue1[row]
        } else {
            value2 = self.placeValue1[row]
        }
    }
    
    @objc func nextVC() {
        let vc = AnalyseGrowth()
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
            calPressed(val1: num1, val2: num2, placeVal1: value1, placeVal2: value2)
            outputLabel.isHidden = false
            resultLabelTrue.isHidden = false
            resultLabelFalse.isHidden = true
            nextButton.isHidden = false
        }
    }
    
    @objc func calPressed(val1: Double, val2: Double, placeVal1: String, placeVal2: String) {
        var num1 = ((Double(smallDict[placeVal1] ?? -1))) * Double(val1)
        var num2 = ((Double(smallDict[placeVal1] ?? -1))) * Double(val2)
        var num_year = 5
        var value1 = pow((Double(num2)/Double(num1)), (Double(1)/Double(num_year))) - 1
        value1 = value1 * 100
        let y = Double(round(value1*1000)/1000)
        resultLabelTrue.text = "\(y)%"
        finalOutput = y
    }
}
