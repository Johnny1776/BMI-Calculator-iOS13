//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightOutlet: UISlider!
    @IBOutlet weak var femaleOutlet: UISwitch!
    @IBOutlet weak var heightOutlet: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sliderTapped(gestureRecognizer:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(sliderTapped(gestureRecognizer:)))
        self.weightOutlet.addGestureRecognizer(tapGestureRecognizer)
        self.heightOutlet.addGestureRecognizer(tapGestureRecognizer2)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func calculateBtn(_ sender: Any) {
        performSegue(withIdentifier: "showResultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let resultsVC = segue.destination as? ResultViewController {
           resultsVC.results = RecommendedText().getResults(femaleOutlet.isOn, weightOutlet.value, heightOutlet.value)
       }
    }
    
    @IBAction func sliderUpdate(_ sender: Any) {
        updateLabels()
    }
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }
    
    func updateLabels(){
        weightLabel.text = "\(String(format: "%.1f", weightOutlet.value))Kg"
        heightLabel.text = "\(String(format: "%.2f", heightOutlet.value/100))m"
    }
    
    @objc func sliderTapped(gestureRecognizer : UIGestureRecognizer){
        let pointTapped: CGPoint = gestureRecognizer.location(in: self.view)
        let positionOfSlider: CGPoint = (gestureRecognizer.view?.frame.origin)!
        let widthOfSlider: CGFloat = (gestureRecognizer.view?.frame.width)!
        let outlet = (gestureRecognizer.view?.tag == 1) ? heightOutlet : weightOutlet
        let newSlideValue = outlet!.minimumValue + ((outlet!.maximumValue - outlet!.minimumValue) *  (Float(pointTapped.x - positionOfSlider.x) / Float(widthOfSlider)))

        outlet!.setValue(Float(newSlideValue), animated: true)
        updateLabels()
    }
}
