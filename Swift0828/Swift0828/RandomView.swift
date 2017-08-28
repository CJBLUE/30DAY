//
//  RandomView.swift
//  Swift0828
//
//  Created by zxjk on 17/8/28.
//
//

import UIKit

class RandomView: UIView {
    var gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createView() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        // 颜色数组
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor,UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.cyan.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
        // 各区间百分比
        //gradientLayer.locations = []
        // 起点
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        // 终点
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        // 添加
        self.layer.addSublayer(gradientLayer)
        
        _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(setGradientColor), userInfo: nil, repeats: true)
    }
    
    func randomColor() -> CGColor{
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0).cgColor
        
    }
    func setGradientColor() {
        var arr = Array<Any>()
        
        for _ in 1...5 {
            arr.append(self.randomColor())
        }
        gradientLayer.colors = arr
    }
}
