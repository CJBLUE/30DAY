//
//  ViewController.swift
//  Swift0829
//
//  Created by zxjk on 17/8/29.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var table = UITableView()
    var alert = UIAlertController()
    var timer = Timer()
    var colorRatio: CGFloat = 10.0
    let cellHeight: CGFloat = 60.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTabelView()
    }

    func createTabelView() {
        table = UITableView(frame: self.view.frame, style: .plain)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        
        alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuse = "reuse"
        let cell = UITableViewCell(style: .default, reuseIdentifier: reuse)
        cell.textLabel?.text = "I am the fucking Teddy bear !"
        cell.selectionStyle = .none
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.cellHeight))
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView.frame
        let lowerColor:CGColor = UIColor(red: (CGFloat(indexPath.row) * self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row) * self.colorRatio)/255.0, alpha: 1).cgColor
        let upperColor:CGColor = UIColor(red: (CGFloat(indexPath.row) * self.colorRatio + self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row) * self.colorRatio + self.colorRatio)/255.0, alpha: 1).cgColor
        
        gradientLayer.colors = [lowerColor, upperColor]

        bgView.layer.addSublayer(gradientLayer)
        cell.addSubview(bgView)
        cell.sendSubview(toBack: bgView)
        cell.frame.origin.y = self.cellHeight
        
        cell.frame.origin.x = self.view.frame.size.width
        UIView.animate(withDuration: 0.4) {
            cell.frame.origin.x = 0
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let likeAction = UITableViewRowAction(style: .default, title: "like") { (UITableViewRowAction, IndexPath) in
            self.alert.message = "like"
            self.showAlert()
        }
        let disLikeAction = UITableViewRowAction(style: .default, title: "disLike") { (UITableViewRowAction, IndexPath) in
            self.alert.message = "disLike"
            self.showAlert()
        }
        let saveAction = UITableViewRowAction(style: .default, title: "save") { (UITableViewRowAction, IndexPath) in
            self.alert.message = "save"
            self.showAlert()
        }
        return [likeAction, disLikeAction, saveAction]
    }
    
    func showAlert() {
        self.present(self.alert, animated: true) { 
            self.timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (Timer) in
                self.alert.dismiss(animated: true, completion: nil)
                self.timer.invalidate()
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        let cells = table.visibleCells
        let tableHeight: CGFloat = table.bounds.size.height
        for (index, cell) in cells.enumerated() {
            cell.frame.origin.y = tableHeight
            cell.frame.origin.x = self.view.frame.size.width
            UIView.animate(withDuration: 1.0, delay: 0.04*Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.frame.origin.y = 0
                cell.frame.origin.x = 0
            }, completion: nil)
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

