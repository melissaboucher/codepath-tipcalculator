//
//  ViewController.swift
//  tips
//
//  Created by Melissa Boucher on 3/28/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var individualTotalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var numPeopleControl: UISegmentedControl!
    @IBOutlet weak var tipFormLabel: UILabel!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var totalFormLabel: UILabel!
    @IBOutlet weak var numPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonFormLabel: UILabel!
    @IBOutlet weak var eachPersonLabel: UILabel!
    @IBOutlet weak var billFormLabel: UILabel!
    @IBOutlet weak var tipCalcLabel: UILabel!
    
    @IBOutlet weak var box: UIView!

    
    let smallFrame = CGRect(x: 158, y: 50, width: 140, height: 30)
    let bigFrame = CGRect(x: 158, y: 125, width: 140, height: 30)
    let smallFrameBill = CGRect(x: 22, y: 54, width: 135, height: 24)
    let largeFrameBill = CGRect(x: 22, y: 129, width: 135, height: 24)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
        

        self.tipLabel.alpha = 0
        self.tipFormLabel.alpha = 0
        self.tipControl.alpha = 0
        self.totalFormLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.line.alpha = 0
        self.numPeopleLabel.alpha = 0
        self.numPeopleControl.alpha = 0
        self.eachPersonFormLabel.alpha = 0
        self.eachPersonLabel.alpha = 0
        
        self.tipCalcLabel.alpha = 1
        self.box.alpha = 0
        
        self.billField.frame = bigFrame
        self.billFormLabel.text="Enter bill amount"
        self.billFormLabel.frame = largeFrameBill
        
        self.billField.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var numPersons = [1.00,2.00,3.00,4.00,5.00,6.00]
        var numPerson = numPersons[numPeopleControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var individualTotal = total/numPerson

        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        individualTotalLabel.text = "$\(individualTotal)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        individualTotalLabel.text = String(format: "$%.2f", individualTotal)
        
        
        if billField.hasText() {
            self.tipCalcLabel.alpha = 0


            UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .CalculationModeCubic, animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.4) {
                    self.billField.frame = self.smallFrame
                    self.billFormLabel.frame=self.smallFrameBill
                }
                }, completion: nil)
            UIView.animateWithDuration(0.8, animations: {
                self.tipLabel.alpha = 1
                self.tipFormLabel.alpha = 1
                self.tipControl.alpha = 1
                self.totalFormLabel.alpha = 1
                self.totalLabel.alpha = 1
                self.line.alpha = 1
                self.numPeopleLabel.alpha = 1
                self.numPeopleControl.alpha = 1
                self.eachPersonFormLabel.alpha = 1
                self.eachPersonLabel.alpha = 1
                self.box.alpha = 1

            })

            
        }
        
        else if billField.hasText()==false {
            UIView.animateKeyframesWithDuration(0.5, delay: 0, options: .CalculationModeCubic, animations: {
                
                UIView.addKeyframeWithRelativeStartTime(0.1, relativeDuration: 0.4) {
                    self.billField.frame = self.bigFrame
                    self.billFormLabel.frame=self.largeFrameBill

                }
                }, completion: nil)

            
            UIView.animateWithDuration(0.4, animations: {
                
                self.tipLabel.alpha = 0
                self.tipFormLabel.alpha = 0
                self.tipControl.alpha = 0
                self.totalFormLabel.alpha = 0
                self.totalLabel.alpha = 0
                self.line.alpha = 0
                self.numPeopleLabel.alpha = 0
                self.numPeopleControl.alpha = 0
                self.eachPersonFormLabel.alpha = 0
                self.eachPersonLabel.alpha = 0
                self.tipCalcLabel.alpha = 1
                self.box.alpha = 0

            })
        }
     
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    

    @IBAction func numPeopleTouchDown(sender: AnyObject) {
        view.endEditing(true)
    }
    

    @IBAction func tipControlTouchDown(sender: AnyObject) {
        view.endEditing(true)
    }
    




    
    

}

