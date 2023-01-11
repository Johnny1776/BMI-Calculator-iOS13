//
//  BMIModel.swift
//  BMI Calculator
//
//  Created by John Durcan on 14/12/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct Results {
    var advice:String
    var bmi: String
    var color: UIColor
}

struct RecommendedText {
   
    var femaleResponses = ["Auschwitz survivors must report immediately for medical care.","Sweets, more sweets and tons of protein. I know you don't want to, but you must!","Catwalk Baby!","Healthy Weight. Nice!","Could do with a little more exercise","Lay off the sweets and wine baby!","Get off your fat ass and get to the gym! NOW!","Go see the Doc., get to the fatso gym and eat protein and salad for 3 months!","Call an Ambulance and the firetruck! They're going to need to haul your ass to the gym ASAP!"]
    var maleResponses = ["The boundary of reality and immortality is only skin deep...just like the boundary between healthy and dead.","Stop worring about the impending Apocoalypse. You've still got to eat. So eat sweets and protein.","Looking a little skinny there. Muscle up with protein and resistence training.","Healthy weight but could do with a some bulking up.","As long as you're lean, you're BUFF! Or are you starting to look a little 'Fatty Mc Fat Fat'?","Dude. Put the beers away, forget the pizza and get down to the gym!","Woah! She left you 6 years ago man! Time to move on, get your sneakers on and get down to the gym.","Pizza, cake and beer do not make a baby. They make a fat ass. Get to the fatso gym and eat protein and salad for 3 months!","Start calling around TV Productions for 'Worlds Fattest Men'. But be quick because your funeral is calling."]
    var textResponse:String?
    
    func getResults(_ female : Bool,_ weight : Float,_ height : Float)->Results{
        let result = Float(weight/pow((height/100),2))
        return Results(advice: self.getText(female, result: result), bmi: String(format: "%.1f", result), color: getColor(female, result: result))
    }
    
    func getColor(_ female : Bool, result : Float) -> UIColor{
        let color: UIColor?
        
        switch getKey(result) {
        case 0...1:
            return UIColor.red
        case 2...3:
            return UIColor.orange
        case 4:
            return UIColor.green
        case 5:
            return UIColor.orange
        default:
            return UIColor.red
        }
    }
    
    func getKey(_ result : Float) -> Int{
        let key:Int?
        switch result {
            case 0...17:
                key = 0
            case 17.001...19.5:
                key = 1
            case 19.501...21:
                key = 2
            case 21.001...22.75:
            key = 3
            case 22.751...25:
            key = 4
            case 25.001...27:
            key = 5
            case 27.001...29:
            key = 6
            case 29.001...32:
            key = 7
            default:
            key = 8
            }
        return key!
    }
    
    func getText(_ female : Bool, result : Float) -> String{

        return female ? femaleResponses[getKey(result)] : maleResponses[getKey(result)]
    }
}
