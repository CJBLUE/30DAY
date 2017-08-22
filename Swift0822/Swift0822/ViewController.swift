//
//  ViewController.swift
//  Swift0822
//
//  Created by zxjk on 17/8/22.
//
//

import UIKit

class ViewController: UIViewController {
    
    // 宽高
    let baseHeight : CGFloat = UIScreen.main.bounds.size.height/3.0;
    let baseWidth : CGFloat = UIScreen.main.bounds.size.width/2.0;
    // 计时器
    var timer : Timer = Timer();
    // 保存当前时间
    var saveTime : Double = Double();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton();
        saveTime = 0.0;
    }
    //MARK: 创建视图
    func createButton() {
        // 计时label
        let showLabel : UILabel = UILabel();
        showLabel.text = "0.0";
        showLabel.backgroundColor = UIColor.black;
        showLabel.textColor = UIColor.white;
        showLabel.tag = 100;
        showLabel.font = UIFont.systemFont(ofSize: 40);
        showLabel.textAlignment = NSTextAlignment.center;
        showLabel.frame = CGRect(x: 0, y: 0, width: baseWidth*2, height: baseHeight);
        self.view.addSubview(showLabel);
        
        // 开始计时按钮
        let startButton:UIButton = UIButton();
        startButton.setTitle("Start", for: UIControlState.normal);
        self.view.addSubview(startButton);
        startButton.frame = CGRect(x: 0, y: baseHeight, width: baseWidth, height: baseHeight*2);
        startButton.addTarget(self, action: #selector(startAction), for: UIControlEvents.touchUpInside);
        startButton.backgroundColor = UIColor.green;
        
        // 暂停按钮
        let pauseButton : UIButton = UIButton();
        pauseButton.setTitle("pause", for: UIControlState.normal);
        pauseButton.frame = CGRect(x: baseWidth, y: baseHeight, width: baseWidth, height: baseHeight*2);
        self.view.addSubview(pauseButton);
        pauseButton.addTarget(self, action: #selector(pauseAction), for: UIControlEvents.touchUpInside);
        pauseButton.backgroundColor = UIColor.blue;
        
        // 重置按钮
        let resetButton : UIButton = UIButton();
        resetButton.setTitle("reset", for: UIControlState.normal);
        resetButton.setTitleColor(UIColor.white, for: UIControlState.normal);
        resetButton.frame = CGRect(x: 20, y: 20, width: 60, height: 40);
        self.view.addSubview(resetButton);
        resetButton.addTarget(self, action: #selector(resetAction(button:)), for: UIControlEvents.touchUpInside);
    }
    // MARK: 开始方法
    func startAction() {
        print("start");
        if self.timer.isValid {
            // timer在运行就返回
            return;
        }
        // 初始化timer
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (Timer) in
            // 找到label
            let tempLabel = self.view.viewWithTag(100) as! UILabel;
            // 改变时间
            self.saveTime += 0.1;
            // 赋值
            tempLabel.text = String(format:"%.1f", self.saveTime);
        })
        // 启动timer
        self.timer.fire();
    }
    // MARK: 暂停方法
    func pauseAction() {
        print("pause");
        // 停止timer
        self.timer.invalidate();
    }
    // MARK: 重置方法
    func resetAction(button: UIButton) {
        // 停止timer
        self.timer.invalidate();
        // 找到label
        let tempLabel = self.view.viewWithTag(100) as! UILabel;
        // 改变时间
        self.saveTime = 0.0;
        // 赋值
        tempLabel.text = String(format:"%.1f", self.saveTime);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

