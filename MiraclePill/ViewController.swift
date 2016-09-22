//
//  ViewController.swift
//  MiraclePill
//
//  Created by Mike Sabens on 9/6/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import UIKit

//Data source and delegates -- code is being told taht this is goign to be the data source for the picker, as well as the delegate which will know when someone scrolls, when it stops, and what the data is when it's selected. 

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pillLogo: UIImageView!
    @IBOutlet weak var titleAndPrice: UIStackView!
    @IBOutlet weak var successButton: UIImageView!
    @IBOutlet weak var customerForm: UIStackView!
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    
    let states = ["Alaska", "Arkansas", "Alabama", "California", "Connecticut", "Vermont", "New York", "Florida"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statePicker.dataSource = self
        statePicker.delegate = self
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stateButtonPressed(_ sender: AnyObject) {
        statePicker.isHidden = false
    }
    
    @IBAction func buyButtonPressed(_ sender: AnyObject) {
        buyButtonPressed()
    }

    
    //number of components (columns in a spreadsheet)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //how many rows in each component? This is going to be based on the number in the array of states from above
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    //return the row from the states array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    //what happens when a user selects a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerButton.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
    }
    
    //creating function to handle tapping buy button
    func buyButtonPressed () {
        customerForm.isHidden = true
        statePicker.isHidden = true
        pillLogo.isHidden = true
        titleAndPrice.isHidden = true
        buyNowButton.isHidden = true
        successButton.isHidden = false
    }

}

