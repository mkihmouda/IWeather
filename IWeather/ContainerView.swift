//
//  MainView.swift
//  IWeather
//
//  Created by Mac on 11/6/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class ContainerView: UIView {
    
    var currentWeatherView : CurrentWeather!
    var forcastWeatherView : ForcastWeather!
    var detailsWeatherView : WeatherDetails!
    var windOtherDetailsView : WindOtherDetails!
//    var place_id : String!
    
    override func awakeFromNib() {
        
        // get current place_id
 
        self.addCurrentWeatherView()
        self.addForcastWeatherView()
        self.addWeatherDetailsView()
        self.addWindOtherDetailsView()
   
  
     }
    
    func addCurrentWeatherView(){
        
        currentWeatherView = Bundle.main.loadNibNamed("CurrentWeather", owner: nil, options: nil)![0] as! CurrentWeather
        self.addSubview(currentWeatherView)

    }
    
    
    func addForcastWeatherView(){
        
        forcastWeatherView = Bundle.main.loadNibNamed("ForcastWeather", owner: nil, options: nil)![0] as! ForcastWeather
        self.addSubview(forcastWeatherView)
        
    }
    
    func addWeatherDetailsView(){
        
        detailsWeatherView = Bundle.main.loadNibNamed("WeatherDetails", owner: nil, options: nil)![0] as! WeatherDetails
        self.addSubview(detailsWeatherView)
        
    }
    
    func addWindOtherDetailsView(){
        
        windOtherDetailsView = Bundle.main.loadNibNamed("WindOtherDetails", owner: nil, options: nil)![0] as! WindOtherDetails
        self.addSubview(windOtherDetailsView)
        
    }
 
   
}
