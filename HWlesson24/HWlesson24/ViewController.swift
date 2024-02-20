//
//  ViewController.swift
//  HWlesson24
//
//  Created by Карина Дьячина on 20.02.24.
//

import UIKit

class ViewController: UIViewController {

    var cityArray: Array<City> = [City(cityName: "London", cityTimezone: TimeZone(identifier: "Europe/London")!),
                                  City(cityName: "New York", cityTimezone: TimeZone(identifier: "America/New_York")!),
                                  City(cityName: "Minsk", cityTimezone: TimeZone(identifier: "Europe/Minsk")!),
                                  City(cityName: "Tokyo", cityTimezone:TimeZone(identifier: "Asia/Tokyo")!)]
    
    var currentDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(currentDate)")
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        
        for city in cityArray {
            
            currentDate = dateFormatter.date(from: "12:00:00")!
            let targetTimeZone = city.cityTimezone
            dateFormatter.timeZone = targetTimeZone
            let timeInCity = dateFormatter.string(from: currentDate)
            
            print("City: \(city.cityName), TimeZone: \(city.cityTimezone.description), Current Time: \(timeInCity)")
        }
        
        
    }


}

