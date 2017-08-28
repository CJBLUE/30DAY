//
//  GradientView.swift
//  Swift0828
//
//  Created by zxjk on 17/8/28.
//
//

import UIKit

class GradientView: UIView {
    
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
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        // 终点
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        // 添加
        self.layer.addSublayer(gradientLayer)
    }

}
