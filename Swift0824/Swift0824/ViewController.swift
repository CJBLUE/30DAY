//
//  ViewController.swift
//  Swift0824
//
//  Created by zxjk on 17/8/24.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.createBarItem()
        // 创建视图
        let inputV = InputView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        self.view.addSubview(inputV)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createBarItem() {
        let left = UIBarButtonItem.init(title: "left", style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftAction))
        self.navigationItem.leftBarButtonItem = left;
        
        let right = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(rightAction))
        let right2 = UIBarButtonItem(title: "right2", style: UIBarButtonItemStyle.done, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItems = [right, right2]
        
        
    }
    func leftAction() {
        print("left")
    }
    func rightAction() {
        print("right")
    }
}

