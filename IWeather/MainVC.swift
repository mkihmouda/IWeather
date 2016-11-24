//
//  ViewController.swift
//  IWeather
//
//  Created by Mac on 11/6/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit
import CoreLocation
import SystemConfiguration


class MainVC: UIViewController,UIScrollViewDelegate,CLLocationManagerDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var hScroll: UIScrollView!
    @IBOutlet var containerView: ContainerView!
    @IBOutlet var mainView: MainView!
    @IBOutlet var fixedSubView: UIView!
 
    var scrollTopFlag = false
    
    // core data methods and var
 

    // core location
    
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        scrollView.delegate = self

       //   self.loadViewsData()
          self.getCorelocationpreCheck()
  
  
    }
 
    
    override func viewDidLayoutSubviews() {
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width , height: self.view.frame.size.height + 667 + 423 + 318 - 10)
   
    }

 
    
 
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
       // print("position is \(self.scrollView.contentOffset.y)")
        
        
        if ((scrollView.contentOffset.y >  UIScreen.main.bounds.size.height - 200) && !scrollTopFlag){
            
        //    print("position is \(self.scrollView.contentOffset.y)")
            scrollTopFlag = true
            
            
            UIView.animate(withDuration: 0.2, animations: {self.containerView.currentWeatherView.alpha = 1.0},
                           completion: {(value: Bool) in
                            self.containerView.currentWeatherView.alpha = 0.0
                            self.fixedSubView.alpha = 1.0
                            
            })
            
        }else if ((scrollView.contentOffset.y <  UIScreen.main.bounds.size.height - 200) && scrollTopFlag){
            
            
        //    print("position is \(self.scrollView.contentOffset.y)")
            scrollTopFlag = false
            
            
            
            UIView.animate(withDuration: 0.2, animations: {self.fixedSubView.alpha = 1.0},
                           completion: {(value: Bool) in
                            self.fixedSubView.alpha = 0.0
                            self.containerView.currentWeatherView.alpha = 1.0
            })
    
    
            
        }else if (scrollView.contentOffset.y >  30){
    
    
           self.containerView.forcastWeatherView.sliderImageView.image = UIImage.init(named: "middleSlider")
           self.mainView.MaxOpacityBlureEffects()
    
    
        }else if (scrollView.contentOffset.y <=  10){
            
            
            self.containerView.forcastWeatherView.sliderImageView.image = UIImage.init(named: "upperSlider")
            self.mainView.MinOpacityBlureEffects()

            
        }
        
    }
    
 
    
    
 
   // MARK: check internet connectivity
    
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
        
    }
    
   
    // MARK: core location functions
    
    
    func getCorelocationpreCheck(){
        
        let coreLocation_flag = UserDefaults.standard.value(forKey: "coreLocation_flag") as! Bool
        
        if (!coreLocation_flag){
            
            UserDefaults.standard.set(true, forKey: "coreLocation_flag")
            UserDefaults.standard.synchronize()
            
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            getCoreLocation()
            
            
        }
        
    }
    
    

    
    func getCoreLocation(){
  
     self.locationManager.requestWhenInUseAuthorization() // ask user for permission
     self.locationManager.startUpdatingLocation() // start update
 
    
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.locationManager.stopUpdatingLocation() // stop update
        self.locationManager.delegate = nil
        
         
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
    }
 
}



