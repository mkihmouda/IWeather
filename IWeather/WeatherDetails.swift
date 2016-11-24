//
//  WeatherDetails.swift
//  IWeather
//
//  Created by Mac on 11/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class WeatherDetails: UIView {
    @IBOutlet var webView: UIWebView!
    
    @IBOutlet var countryCode: UILabel!
    @IBOutlet var placeName: UILabel!
    @IBOutlet var longitude: UILabel!
    @IBOutlet var latitiude: UILabel!
    
    @IBOutlet var weatherType: UILabel!
    @IBOutlet var currentTemp: UILabel!
    
    
    
    
    override func awakeFromNib() {
        
        self.frame = CGRect(origin: CGPoint(x: 0,y :screenHeight + 667 - 151 - 10 ), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        self.addBlureEffects()
      
    }

    
 
 
    func addBlureEffects(){
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(origin: CGPoint(x: 10 ,y : 10 ),  size: CGSize(width: self.frame.size.width - 20, height: self.frame.size.height - 10))
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        blurEffectView.alpha = 0.85
        self.addSubview(blurEffectView)
        self.sendSubview(toBack: blurEffectView)
        
    }
    
    
    
}
