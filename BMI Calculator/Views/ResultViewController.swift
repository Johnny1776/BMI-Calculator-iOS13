//
//  resultViewController.swift
//  BMI Calculator
//
//  Created by John Durcan on 14/12/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var recommendOutlet: UILabel!
    @IBOutlet weak var resultsBackground: UIImageView!
    var results: Results!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultOutlet.text = results.bmi
        recommendOutlet.text = results.advice
        view.backgroundColor = results.color
    }

    @IBAction func btnTapped(_ sender: UIStoryboardSegue) {
    }
}

