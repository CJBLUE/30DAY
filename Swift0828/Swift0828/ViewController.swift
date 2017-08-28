//
//  ViewController.swift
//  Swift0828
//
//  Created by zxjk on 17/8/28.
//
//

import UIKit

class ViewController: UIViewController {

    let flag = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if flag {
            let gradientView = GradientView(frame: self.view.frame)
            self.view.addSubview(gradientView)
        }else {
            let randomView = RandomView(frame: self.view.frame)
            self.view.addSubview(randomView)
        }
        

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

