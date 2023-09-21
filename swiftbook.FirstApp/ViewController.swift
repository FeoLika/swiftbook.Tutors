//
//  ViewController.swift
//  swiftbook.FirstApp
//
//  Created by FeoLika on 19.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!
    private var resultText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let range = sender.date..<Date.now
        resultText = "Ты радуешься жизни уже \(range.formatted(.components(style: .wide, fields: [.day])))"
    }
    
    @IBAction func getResult() {
        resultLabel.text = resultText
    }
    
}

