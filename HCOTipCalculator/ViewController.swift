//
//  ViewController.swift
//  HCOTipCalculator
//
//  Created by Isabel Yepes on 18/09/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

   override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("percentageIndexSelected")
        tipControl.selectedSegmentIndex = intValue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func billEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentageSelected = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billText.text).doubleValue
        var tip = billAmount * tipPercentageSelected
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    
    
    
}

