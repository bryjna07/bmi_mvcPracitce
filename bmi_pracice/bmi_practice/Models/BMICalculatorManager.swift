//
//  BMICalculatorManager.swift
//  bmi_practice
//
//  Created by t2023-m0033 on 12/1/24.
//

import UIKit

// BMI 를 계산해내는 객체의 역할
struct BMICalculatorManager {  // 클래스로 만들어도됨, 큰 프로젝트에서는 클래스 사용 ( 힙에 저장되는 것이 좋음, 여러개의 뷰컨에서 접근하기때문 )
    
    //BMI계산 결과값 보관을 위한 변수
    var bmi: Double?
    
    
    mutating func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = 0.0
            return
        }
        var bmiNumber = w / (h * h) * 10000
       // print("BMI 결과값(반올림전)\(bmi)")
        bmi = round(bmiNumber * 10) / 10
        //print("BMI 결과값(반올림후)\(bmi)")
    }
    
    
    func getBMIResult() -> Double {
        return bmi ?? 0.0
    }
    
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return .blue
        case 18.6..<23.0:
            return .red
        case 23.0..<30.0:
            return .green
        case 30.0...:
            return .yellow
        default:
            return .black
        }
    }
        
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
}
