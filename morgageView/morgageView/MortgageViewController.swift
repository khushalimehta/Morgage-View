//
//  ViewController.swift
//  morgageView
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var currentPrice: UITextField!
    @IBOutlet weak var interestRate: UILabel!
    @IBOutlet weak var noOfYears: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var totalPayment: UILabel!
    
    var mortgageCalc = MortgageCalc()
    
    @IBAction func changeYears(sender: UIStepper) {
        noOfYears.text = "\(Int(stepper.value))"
    }
    
   
    @IBAction func changeInterestRate(sender: UISlider) {
        let currentInterestRate = sender.value
        interestRate.text = String(format:"%.1f", currentInterestRate) + "%"
        // "\(currentInterestRate)" + "%"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentPrice.becomeFirstResponder()
        stepper.wraps = true
        stepper.maximumValue = 30
        stepper.autorepeat = true // holding down.
        
        stepper.value = NSNumberFormatter().numberFromString(noOfYears.text!)!.doubleValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func calculateMonthlyPayment(sender: UIButton) {
        let currentValue = NSNumberFormatter().numberFromString(currentPrice.text!)!.doubleValue
        let tax = NSNumberFormatter().numberFromString(taxRate.text!)!.doubleValue
        //var intRate = NSNumberFormatter().numberFromString(intRateValue)!.doubleValue / 100.0
        let location = (interestRate.text!).characters.count - 1
        
        let intRate = NSNumberFormatter().numberFromString(
            interestRate.text!.substringToIndex(interestRate.text!.startIndex.advancedBy(location))
            )!.doubleValue / 100.0
        
        //let nyears = NSNumberFormatter().numberFromString(noOfYears.text!)!.doubleValue
        
        let nyears = Int(noOfYears.text!)!
        //print("current value \(currentValue)")
        //print("tax \(tax)")
        //print("intRate \(intRate)")
        //print("nyears \(nyears)")
        //intRate /= 12.0
        //tax = (tax / 12.0) * currentValue
        
        //var pmt = currentValue * (intRate + intRate / pow(1.0 + intRate, nyears * 12))
        //pmt += tax
        mortgageCalc.setValues(currentValue,tax,intRate,nyears)
        
        totalPayment.text = String(format:"$%.2f", mortgageCalc.computeMonthlyPayment())
        
    }


}


