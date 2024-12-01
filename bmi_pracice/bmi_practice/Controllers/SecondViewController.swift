//
//  SecondViewController.swift
//  bmi_practice
//
//  Created by t2023-m0033 on 12/1/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmiNumber: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        backButton.setTitle("다시 계산하기", for: .normal)
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        guard let bmi = bmiNumber else { return }
        bmiNumberLabel.text = String(bmi)
        
        adviceLabel.text = adviceString
        bmiNumberLabel.backgroundColor = bmiColor
        
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
