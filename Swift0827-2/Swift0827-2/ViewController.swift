//
//  ViewController.swift
//  Swift0827-2
//
//  Created by zxjk on 17/8/27.
//  Copyright © 2017年 zxjk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var imageView:UIImageView!
    var scrollView:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "CJ")
        imageView.isUserInteractionEnabled = true
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1
        scrollView.backgroundColor = UIColor.black
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // 这个方法我写OC代码时候也没用过，整体比较简单
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }



}

