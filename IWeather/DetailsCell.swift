//
//  DetailsCell.swift
//  IWeather
//
//  Created by Mac on 11/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class DetailsCell: UIView {
    
   
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var value: UILabel!
    @IBOutlet var name: UILabel!

    let dataNameArray = ["Sunrise","Sunset","Cloud","Visibility"]
    let dataImageArray = ["sunriseIcon","sunsetIcon","Clouds","visibilityIcon"]
    
    override func awakeFromNib() {
        

        
    }
    
    
    func loadData(counter : Int, value : String){
        
 
        self.imageView.image = UIImage.init(named: self.dataImageArray[counter])
        
    
    }

}
