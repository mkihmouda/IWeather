//
//  ForcastWeather.swift
//  IWeather
//
//  Created by Mac on 11/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit
import Foundation

class ForcastWeather: UIView {
    
    @IBOutlet var xx: UIStackView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var scrollViewContainer: UIView!
    @IBOutlet var sliderImageView: UIImageView!
    
 
    override func awakeFromNib() {
        
 
        self.frame = CGRect(origin: CGPoint(x: 0,y : screenHeight - 180), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        self.addBlureEffects()
        self.addDailyForcastData()
        self.addHourlyForcastData()
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
    
 
    
    
    
    func addDailyForcastData(){
        
 
   
        for  i in 0...6 {
            
 
            let  forcastCell = Bundle.main.loadNibNamed("WeekForcastCell", owner: nil, options: nil)![0] as! WeekForcastCell
                  self.xx.addArrangedSubview(forcastCell)
 
        
    }
    
    }
    
    func addHourlyForcastData(){
        
 

        var counter = 0
        
        for  i in 0...14 {
            
            
            let  forcastCell = Bundle.main.loadNibNamed("HourlyForcastCell", owner: nil, options: nil)![0] as! HourlyForcastCell
                 forcastCell.frame = CGRect(origin: CGPoint(x: 70*counter ,y : 0 ),  size: CGSize(width: 70, height: 70))
  
            
                    self.scrollView.addSubview(forcastCell)
                        counter += 1
            
        }
        
        
            scrollView.contentSize = CGSize(width: 70 * (counter + 1) , height: 70)
            self.scrollView.scrollsToTop = false
        
    }
 
 
    
    
  
    
 
        
        
        
}
