//
//  ViewController.swift
//  Swift0904-1
//
//  Created by zxjk on 17/9/4.
//  Copyright © 2017年 zxjk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var piker = UIPickerView()
    var dataArr = ["🐭", "🐂", "🐯", "🐰", "🐲", "🐍", "🐎", "🐑", "🐵", "🐔", "🐶", "🐷"]
    
    var resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createView()
    }

    func createView() {
        piker = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 220))
        self.view.addSubview(piker)
        piker.dataSource = self
        piker.delegate = self
        piker.center.x = self.view.center.x
        piker.center.y = self.view.center.y-50
        
        
        let goButton = UIButton(type: .roundedRect)
        goButton.backgroundColor = UIColor.green
        goButton.frame = CGRect(x: 0, y: 0, width: 275, height: 40)
        self.view.addSubview(goButton)
        goButton.setTitle("Go", for: UIControlState.normal)
        goButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        goButton.center.y = self.view.center.y + 140
        goButton.center.x = self.view.center.x
        goButton.addTarget(self, action: #selector(goAction), for: UIControlEvents.touchUpInside)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(longTapAction))
        doubleTapGesture.numberOfTapsRequired = 2
        goButton.addGestureRecognizer(doubleTapGesture)
        
        resultLabel = UILabel(frame:CGRect(x: 0, y: 0, width: 200, height: 50))
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        resultLabel.text = ""
        resultLabel.textColor = UIColor.black
        self.view.addSubview(resultLabel)
        resultLabel.center.x = self.view.center.x
        resultLabel.center.y = goButton.center.y + 100
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.text = dataArr[row]
        pickerLabel.textAlignment = .center
        pickerLabel.font = UIFont.systemFont(ofSize: 60)
        return pickerLabel
    }
    
    func goAction() {
        piker.selectRow(Int(arc4random())%(dataArr.count - 2) + 1, inComponent: 0, animated: true)
        piker.selectRow(Int(arc4random())%(dataArr.count - 2) + 1, inComponent: 1, animated: true)
        piker.selectRow(Int(arc4random())%(dataArr.count - 2) + 1, inComponent: 2, animated: true)

        self.judge()
    }
    
    func longTapAction() {
        let result = Int(arc4random())%(dataArr.count - 2)
        piker.selectRow(result + 1, inComponent: 0, animated: true)
        piker.selectRow(result + 1, inComponent: 1, animated: true)
        piker.selectRow(result + 1, inComponent: 2, animated: true)
        
        self.judge()
    }
    
    func judge() {
        if piker.selectedRow(inComponent: 0) == piker.selectedRow(inComponent: 1) && piker.selectedRow(inComponent: 1) == piker.selectedRow(inComponent: 2) {
            resultLabel.text = "👏👏👏"
        }
        else {
            resultLabel.text = "💔💔💔"
        }
    }
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

