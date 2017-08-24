//
//  InputView.swift
//  Swift0824
//
//  Created by zxjk on 17/8/24.
//
//

import UIKit

class InputView: UIView, UITextViewDelegate{
    // 输入框
    var textV = UITextView()
    // 输入个数label
    var numberLabel = UILabel()
    // 输入最大个数
    let max = 10
    // 当前输入个数
    var current = 0
    
    // 重写初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
        self.addNotificationCenter()
    }
    
    // 自动提示让写的=。= 查了下资料 说是xib创建视图时候的方法，并不知道
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 创建视图
    func createView() {
        let imgView = UIImageView.init(frame: CGRect(x: 0, y: 20, width: 50, height: 50))
        self.addSubview(imgView)
        imgView.image = UIImage.init(named: "CJ")
        
        textV = UITextView.init(frame: CGRect(x: 50, y: 20, width: UIScreen.main.bounds.size.width-50, height: 200))
        self.addSubview(textV)
        textV.backgroundColor = UIColor.init(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        textV.delegate = self
        textV.font = UIFont.systemFont(ofSize: 20)
        
        numberLabel = UILabel.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height-30, width: UIScreen.main.bounds.size.width, height: 30))
        numberLabel.textAlignment = NSTextAlignment.right
        numberLabel.text = String(format: "0/%d", max)
        self.addSubview(numberLabel)
    }
    
    // textView Delegete 输入发生改变
    func textViewDidChange(_ textView: UITextView) {
        current = textView.text.characters.count
        let str = textView.text as NSString
        // 输入>=最大 失去第一响应
        if current >= max {
            textV.resignFirstResponder()
        }
        // 输入>最大 跳过次判断 截取字符串，else 赋值
        guard current > max else {
            numberLabel.text = String(format: "%d/%d", current, max)
            return
        }
        textView.text = str.substring(to: max)
    }
    
    // 添加键盘监听
    func addNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // 键盘将要出现
    func keyboardWillShow(noti: NSNotification) {
        // 获取键盘相关字典
        var dic = Dictionary<String, Any>()
        dic = noti.userInfo as! Dictionary<String, Any>
        // 获取键盘坐标
        var rect = CGRect()
        rect = dic[UIKeyboardFrameBeginUserInfoKey] as! CGRect
        // 动画改变位置
        UIView.animate(withDuration: dic[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval) {
            self.numberLabel.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height-30-rect.size.height, width: UIScreen.main.bounds.size.width, height: 30)
        }
    }
    
    // 键盘将要消失
    func keyboardWillHide(noti: NSNotification) {
        // 获取键盘相关字典
        var dic = Dictionary<String, Any>()
        dic = noti.userInfo as! Dictionary<String, Any>
        // 动画改变位置
        UIView.animate(withDuration: dic[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval) {
            self.numberLabel.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height-30, width: UIScreen.main.bounds.size.width, height: 30)
        }
    }
    
    // 点击空白 回收键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textV.resignFirstResponder()
        // 这两种方法都可以
        //UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
