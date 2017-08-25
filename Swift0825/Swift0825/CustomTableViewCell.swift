//
//  CustomTableViewCell.swift
//  Swift0825
//
//  Created by zxjk on 17/8/25.
//
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var left = UILabel()
    var right = UILabel()
    // 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 创建视图
    func createView() {
        left = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width/2.0, height: self.frame.size.height))
        self.addSubview(left)
        
        right = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width/2.0, y: 0, width: UIScreen.main.bounds.size.width/2.0, height: self.frame.size.height))
        right.textAlignment = .right
        self.addSubview(right)
    }
    // 赋值方法
    public func setData(data: String) {
        left.text = data
        right.text = data
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
