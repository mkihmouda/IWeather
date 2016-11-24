//
//  MainView.swift
//  IWeather
//
//  Created by Mac on 11/9/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class MainView: UIView {

    @IBOutlet var placeName: UILabel!
    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var placePhoto: UIImageView!
    
    
    var blurEffectView : UIVisualEffectView!

    override func awakeFromNib() {
        
        self.addBlureEffects()
        
    }
 
    

        
        
        func addBlureEffects(){
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = CGRect(origin: CGPoint(x: 0 ,y : 0 ),  size: CGSize(width: self.frame.size.width , height: self.frame.size.height))
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
            self.MinOpacityBlureEffects()
            self.placePhoto.addSubview(blurEffectView)
            self.sendSubview(toBack: blurEffectView)
            
        }
    
    
    func MaxOpacityBlureEffects(){
        
     
            blurEffectView.alpha = 0.75
    }
    
    
    func MinOpacityBlureEffects(){


            blurEffectView.alpha = 0.35
        
        }
    
  
}
