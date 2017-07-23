//
//  mortgageSwift.swift
//  morgageView
//
//

import Foundation

class MortgageCalc
{
    var currentValue:Double
    var tax:Double
    var intRate:Double
    var nyears:Int
    
    init()
    {
        currentValue = 0.0
        tax = 0.0
        intRate = 0.0
        nyears = 0
    }
    
    func setValues(cv:Double, _ t:Double, _ i:Double, _ y:Int)
    {
        currentValue = cv
        tax = t
        intRate = i
        nyears = y
    }
    
    func computeMonthlyPayment() -> Double
    {
        print("current value = \(currentValue)")
        print("tax \(tax)")
        print("intRate \(intRate)")
        print("nyears \(nyears)")
        intRate /= 12.0
        tax = (tax / 12.0) * currentValue
        var pmt = currentValue * (intRate + intRate / pow(1.0 + intRate, Double(nyears) * 12.0))
        pmt += tax
        return pmt
    }
}
