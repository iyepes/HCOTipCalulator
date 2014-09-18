//
//  settingsViewController.swift
//  HCOTipCalculator
//
//  Created by Isabel Yepes on 18/09/14.
//  Copyright (c) 2014 Isabel Yepes. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {

    @IBOutlet weak var percentageSelected: UISegmentedControl!
    @IBOutlet weak var peopleRecorded: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("percentageIndexSelected")
        percentageSelected.selectedSegmentIndex = intValue
        var temp: AnyObject? = defaults.objectForKey("usualPeople")
        if temp == nil {peopleRecorded.text = "1"
        } else {
            var stringValue = defaults.objectForKey("usualPeople") as String
            peopleRecorded.text = stringValue
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func isDone(sender: AnyObject) {
                dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func savePercentage(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(percentageSelected.selectedSegmentIndex, forKey: "percentageIndexSelected")
        defaults.synchronize()
    }
    
    @IBAction func savePeople(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(peopleRecorded.text, forKey: "usualPeople")
        defaults.synchronize()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
