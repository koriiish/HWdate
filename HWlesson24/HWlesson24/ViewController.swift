//
//  ViewController.swift
//  HWlesson24
//
//  Created by Карина Дьячина on 20.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var cityArray: Array<String> = ["London", "New York", "Minsk","Tokyo"]
    var timezonesArray: Array<TimeZone> = [(TimeZone(identifier:"Europe/London")!), (TimeZone(identifier: "America/New_York")!), (TimeZone(identifier: "Europe/Minsk")!), (TimeZone(identifier: "Asia/Tokyo")!)]
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    var currentDate = Date()
    var selectedCountryIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Current date: \(currentDate)"
        textFieldSettings()
        
    }
    
    func setupDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        if let selectedCountryIndex = selectedCountryIndex {
            let targetTimeZone = timezonesArray[selectedCountryIndex]
            dateFormatter.timeZone = targetTimeZone
            let timeInCity = dateFormatter.string(from: currentDate)
            let city = cityArray[selectedCountryIndex]
               
            textField.text = "\(city) / \(timeInCity)"
            }
        }
        
        
        func textFieldSettings() {
            textField.inputView = pickerView
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(doneButtonTapped))
            toolbar.setItems([doneButton], animated: false)
            
            textField.inputAccessoryView = toolbar
        }
        
        @objc func doneButtonTapped() {
            textField.resignFirstResponder()
        }
    }

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        cityArray.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountryIndex = row
        setupDate()
    }
}
