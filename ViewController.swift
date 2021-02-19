//
//  ViewController.swift
//  convertor
//
//  Created by Artur on 14/02/21.
//  Copyright © 2021 Artur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showNext(_ sender: UIButton) {
        
        switch lbUnit.text!{
            case "Temperature":
                lbUnit.text = "Weight"
                btUnit1.setTitle("Kilogram", for: .normal)
                btUnit2.setTitle("Pound", for: .normal)
            case "Weight":
                lbUnit.text = "Currency"
                btUnit1.setTitle("CAD", for: .normal)
                btUnit2.setTitle("Real", for: .normal)
            case "Currency":
                lbUnit.text = "Distance"
                btUnit1.setTitle("Kilometre", for: .normal)
                btUnit2.setTitle("Metre", for: .normal)
            default:
                lbUnit.text = "Temperature"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
            }
        convert(nil)
    }
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender{
            if sender == btUnit1{
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text!{
        case "Temperature":
            calcTemp()
        case "Weight":
         calcWeight()
        case "Currency":
            calcCurr()
        default:
            calcDist()
        }
    }
    func calcTemp(){
        guard let temp = Double(inputValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            labelResult.text = "Farenheint"
            lbResult.text = String(temp * 1.8 + 32.0)
        }else{
            labelResult.text = "Celsius"
            lbResult.text = String((temp - 32.0 ) / 1.8)
        }
    }
    func calcWeight(){
        guard let weight = Double(inputValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            labelResult.text = "Pound"
            lbResult.text = String(weight * 2.205)
        }else{
            labelResult.text = "Kilogram"
            lbResult.text = String(weight / 2.205)
        }
    }
    func calcCurr(){
        guard let curr = Double(inputValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            labelResult.text = "Real"
            lbResult.text = String(curr * 4.32 )
        }else{
            labelResult.text = "CAD"
            lbResult.text = String(curr  / 4.32)
        }
    }
    func calcDist(){
        guard let dist = Double(inputValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            labelResult.text = "Metre"
            lbResult.text = String(dist / 1000)
        }else{
            labelResult.text = "Kilometre"
            lbResult.text = String(dist * 1000)
        }
    }
}

