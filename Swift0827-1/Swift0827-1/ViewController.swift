//
//  ViewController.swift
//  Swift0827-1
//
//  Created by zxjk on 17/8/27.
//
//

import UIKit

class ViewController: UIViewController {
    
    var findView = FindView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        findView = FindView(frame: self.view.frame)
        self.view.addSubview(findView)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

