//
//  ViewController.swift
//  Swift0823
//
//  Created by zxjk on 17/8/23.
//
//

import UIKit

class ViewController: UIViewController {

    // 字体数组
    var fontNamesArr : NSMutableArray = []
    // 文本
    var textLabel : UILabel = UILabel()
    // 当前字体下标
    var index : NSInteger = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllFontNames()
        self.createView()
    }
    // MARK: 创建视图
    func createView() {
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 400))
        textLabel.text = "I am the fucking Teddy bear ~~~~~~~~~~~~~~~~~~~~~~~~"
        textLabel.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(textLabel)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.backgroundColor = UIColor.green
        textLabel.textColor = UIColor.black
        textLabel.numberOfLines = 0
        
        let changeButton : UIButton = UIButton(type: UIButtonType.system)
        changeButton.frame = CGRect(x: 0, y: 400, width: self.view.frame.size.width, height: self.view.frame.size.height-400)
        changeButton.backgroundColor = UIColor.blue
        changeButton.setTitle("change", for: UIControlState.normal)
        changeButton.titleLabel?.font = UIFont.systemFont(ofSize: 40);
        self.view.addSubview(changeButton)
        changeButton.addTarget(self, action: #selector(change), for: UIControlEvents.touchUpInside)
    }
    
    // MARK: 点击方法
    func change() {
        if index >= fontNamesArr.count-1 {
            index = 0
        }else {
            index += 1
        }
        textLabel.font = UIFont(name: fontNamesArr[index] as! String, size: 20)
    }
    // MARK:获取字体，代码来自于大神的demo
    func getAllFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("++++++ \(familyName)")
            fontNamesArr.add(familyName)
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("----- \(fontName)")
                fontNamesArr.add(fontName)
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

