//
//  ViewController.swift
//  The ArithMETic App
//
//  Created by student on 2/14/19.
//  Copyright © 2019 student. All rights reserved.
//


import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var game:String? = "Select Activity"
    let activity = ["Select Activity","Bicycling","Jumping rope","Running - slow","Running - fast","Tennis","Swimming"]

    
    @IBOutlet weak var Activity: UIPickerView!
    //@IBOutlet weak var Activity: UITextField!
    
    @IBOutlet weak var Weight: UITextField!
    
    @IBOutlet weak var Exercise: UITextField!
    
    
    @IBOutlet weak var Energy: UILabel!
    
    
    @IBOutlet weak var Time: UILabel!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activity[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activity.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        game = activity[row]
    }
    
    @IBAction func Calculate(_ sender: Any) {
        let weight = Double(Weight.text!)
        let exercise = Double(Exercise.text!)
        
        if weight == nil || exercise == nil || game == "Select Activity"{
            
        }else{
            let energyConsumed = ExerciseCoach.energyConsumed(during: game!, weight: weight!, time: exercise!)
            let timeToLose1Pound = ExerciseCoach.timeToLose1Pound(during:game!,weight:weight!)
            Energy.text = "\(energyConsumed) cal"
            Time.text = "\(timeToLose1Pound) minutes"
        }
        
    }

    @IBAction func Clear(_ sender: Any) {
        game = "Select Activity"
        Weight.text = ""
        Exercise.text = ""
        Energy.text = "0 cal"
        Time.text = "0 minutes"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
struct ExerciseCoach{
    static let sports:[String:Double] = ["Bicycling":8.0,"Jumping rope":12.3,"Running - slow":9.8,"Running - fast":23.0,"Tennis":8.0,"Swimming":5.8]
    static let kg:Double = 2.2
    static func energyConsumed(during: String,weight: Double,time: Double) -> Double{
        let met = sports[during]!
        let energyConsumed:Double = Double(String(format: "%.1f", ((met * 3.5 * (weight/kg))/200)*time))!
        return energyConsumed
        
    }
    
    static  func timeToLose1Pound(during: String,weight: Double) -> Double{
        
        let met:Double = sports[during]!
        let timeToLose1Pound:Double = Double(String(format: "%.1f",(3500/((met * 3.5 * (weight/kg))/200))))!
        return timeToLose1Pound
        
    }
    
}

