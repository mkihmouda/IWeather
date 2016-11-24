//
//  WindOtherDetails.swift
//  IWeather
//
//  Created by Mac on 11/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class WindOtherDetails: UIView {

    @IBOutlet var webView: UIWebView!
    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet var windSpeed: UILabel!
    @IBOutlet var windDegree: UILabel!
    @IBOutlet var pressure: UILabel!
    @IBOutlet var humidity: UILabel!
    
    var detailsCellValueArray : [String]?
    
    
    
    
    override func awakeFromNib() {
        
        self.frame = CGRect(origin: CGPoint(x: 0,y : screenHeight + 667 + 423 - 151 - 10 ), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        self.addBlureEffects()
        self.loadMoreDetails()
 
    }
 
    
    func loadMoreDetails(){
        
 
        
   
        for i in 0 ... 3{
 

            let  forcastCell = Bundle.main.loadNibNamed("DetailsCell", owner: nil, options: nil)![0] as! DetailsCell
                 forcastCell.frame = CGRect(origin: CGPoint(x: 0,y : 0), size: CGSize(width: 70, height: 70))
            
                 forcastCell.loadData(counter: i, value: "data")
            
                self.stackView.addArrangedSubview(forcastCell)
            
        }
        
        
    }
    
 
    
    func addBlureEffects(){
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(origin: CGPoint(x: 10 ,y : 10 ),  size: CGSize(width: self.frame.size.width - 20, height: self.frame.size.height + 20 ))
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        blurEffectView.alpha = 0.85
        self.addSubview(blurEffectView)
        self.sendSubview(toBack: blurEffectView)
        
    }

}
