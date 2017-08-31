//
//  ViewController.swift
//  Swift0831
//
//  Created by zxjk on 17/8/31.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    var table = UITableView()
    var headImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createView()
    }
    
    func createView() {
        
        headImageView = UIImageView(image: UIImage(named: "CJ"))
        headImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        self.view.addSubview(headImageView)
        
        table = UITableView(frame: CGRect(x: 0, y: self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.height-self.view.frame.size.width), style: .plain)
        table.dataSource = self;
        table.delegate = self;
        self.view.addSubview(table)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuse = "reuse"
        var cell = tableView.dequeueReusableCell(withIdentifier: reuse)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuse)
        }
        cell?.textLabel?.text = "哈撒给"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            let maxOffsetY = table.frame.height
            let validateOffsetY =  -offsetY / maxOffsetY
            let scaleFactor = 1 + validateOffsetY
            headImageView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }
        
        
        
    }
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

