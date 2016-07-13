//
//  ViewController.swift
//  Day6-Get user's current location
//
//  Created by 孔凡列 on 16/7/11.
//  Copyright © 2016年 clarence. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController  {
    
    let windowW = UIScreen.mainScreen().bounds.size.width
    
    let windowH = UIScreen.mainScreen().bounds.size.height
    
    var location : CLLocation?
    
    var locationManager : CLLocationManager!
    
    var locationLabel : UILabel!
    
    var bgImageView : UIImageView!
    
    var btn : UIButton!
    
    lazy var effectView : UIVisualEffectView  = {
        var effect = UIBlurEffect.init(style: UIBlurEffectStyle.Dark)
        var v = UIVisualEffectView.init(effect: effect)
        v.frame = self.view.bounds
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        bgImageView = UIImageView()
        bgImageView.image = UIImage.init(named: "bg")
        bgImageView.frame = view.bounds
        bgImageView.addSubview(effectView)
        view.addSubview(bgImageView)
        
        btn = UIButton.init()
        btn.addTarget(self, action: Selector("getLocation"), forControlEvents: UIControlEvents.TouchUpInside)
        btn.setBackgroundImage(UIImage.init(named: "Find my location"), forState: UIControlState.Normal)
        btn.setTitle("Find my location", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.sizeToFit()
        
        btn.center = CGPoint.init(x: self.view.fl_centerX, y: windowH * 0.8)
        print(btn.fl_x,btn.fl_y,btn.fl_width,btn.fl_height,btn.fl_top,btn.fl_bottom,btn.fl_left,btn.fl_right)
        view.addSubview(btn)
        
        locationLabel = UILabel.init(frame: CGRect.init(x: 20, y: 100, width: windowW - 40, height: 100))
        locationLabel.textAlignment = NSTextAlignment.Center
        locationLabel.numberOfLines = 0
        locationLabel.textColor = UIColor.whiteColor()
        locationLabel.backgroundColor = UIColor.lightTextColor()
        self.view.addSubview(locationLabel)
        
    }
    
    func getLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    }

}



extension ViewController : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("hello world")
        let firstLocation = locations.first
        
        CLGeocoder().reverseGeocodeLocation(firstLocation!) { (placemarks, error) -> Void in
            if (error != nil) {
                self.locationLabel?.text = "error = " + (error?.description)!
            }
            else{
                let placemark = placemarks?.first
                print(placemark?.name)
                self.locationLabel?.text = placemark?.name
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        locationLabel.text = NSString.init(format: "%@", error) as String
        print(error)
    }
}

