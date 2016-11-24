//
//  CurrentWeather.swift
//  IWeather
//
//  Created by Mac on 11/6/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class CurrentWeather: UIView {
    
    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var currentStatus: UILabel!
    @IBOutlet var webView: UIWebView!
    
 
 

    override func awakeFromNib() {
  
     self.frame = CGRect(origin: CGPoint(x: 0,y :screenHeight - self.frame.size.height - 151 - 20 ), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        
 
   
    }
    
 
  
}
