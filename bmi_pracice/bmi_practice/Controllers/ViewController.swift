//
//  ViewController.swift
//  bmi_practice
//
//  Created by t2023-m0033 on 12/1/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    //BMI매니저랑 의사소통을 할 객체를 생성 해줘야함
    var bmiManager = BMICalculatorManager()  // 계산 로직을 매니저 안에 넣어야함
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        makeUI()
    }

    func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해주세요"
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
        
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    
        // bmi 결과 값을 뽑아냄 - bmi 매니저야 계산해줘 ( 위임시킴 )
        // 어차피 버튼을 누르면 아래 세그웨이가 실행됨
        
        
    //   bmi = calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
           let secondVC = segue.destination as! SecondViewController
            
            // 계산된 결과값을 다음 화면으로 데이터 전달
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        }
        
        heightTextField.text = ""
        weightTextField.text = ""
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
      //  if textField == heightTextField {   텍스트필드 하나만 허용하려면
        
        if Int(string) != nil || string == "" {
            return true // 글자 입력 허용
        }
        return false  // 글자 입력 허용 x
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
    
}

