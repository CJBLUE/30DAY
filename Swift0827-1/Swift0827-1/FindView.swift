//
//  FindView.swift
//  Swift0827-1
//
//  Created by zxjk on 17/8/27.
//
//

import UIKit
import CoreLocation

class FindView: UIView, CLLocationManagerDelegate {
    
    // 定位
    var locationManager = CLLocationManager()
    // 经纬度转换成地址
    let geocoder = CLGeocoder()
    
    var positionLabel = UILabel()
    var findButton = UIButton()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .orange
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        
        positionLabel = UILabel(frame: CGRect(x: 10, y: 50, width: self.frame.size.width-20, height: 100))
        positionLabel.numberOfLines = 0
        positionLabel.textColor = .white
        positionLabel.font = .systemFont(ofSize: 20)
        positionLabel.textAlignment = .center
        self.addSubview(positionLabel)

        findButton = UIButton(type: .system)
        findButton.frame = CGRect(x: 10, y: self.frame.size.height-20-40, width: self.frame.size.width-20, height: 40)
        self.addSubview(findButton)
        findButton.setTitle("Find My Position", for: .normal)
        findButton.setTitleColor(.white, for: .normal)
        findButton.addTarget(self, action: #selector(find), for: .touchUpInside)
        
        locationManager.delegate = self
    }
    // 按钮方法
    func find() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    // 代理
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        locationManager.stopUpdatingLocation()
        
        let locations : NSArray = locations as NSArray
        let currentLocation = locations.lastObject as! CLLocation
        reverseGeocode(location:currentLocation)
    }
    
    ///将经纬度转换为城市名
    func reverseGeocode(location:CLLocation) {
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if(error == nil) {
                let tempArray = placeMark! as NSArray
                let mark = tempArray.firstObject as! CLPlacemark
                //                now begins the reverse geocode
                let addressDictionary = mark.addressDictionary! as NSDictionary
                let country = addressDictionary.value(forKey: "Country") as! String
                let city = addressDictionary.object(forKey: "City") as! String
                let street = addressDictionary.object(forKey: "Street") as! String
                
                let finalAddress = "\(street),\(city),\(country)"
                self.positionLabel.text = finalAddress
            }
        }
    }
}
