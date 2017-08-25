//
//  ViewController.swift
//  Swift0825
//
//  Created by zxjk on 17/8/25.
//
//

import UIKit
let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // table
    var table = UITableView()
    // 刷新控件
    var refresh = UIRefreshControl()
    // 数据源
    lazy var dataArr = Array(arrayLiteral: "😀", "😀", "😀", "😀")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTableView()
    }
    
    // 创建table
    func createTableView() {
        table = UITableView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT), style: .plain)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        
        // 创建刷新控件
        refresh.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        table.addSubview(refresh)
        refresh.backgroundColor = .green
        refresh.tintColor = .white
    }
    
    // 刷新方法
    func refreshAction() {
        // 获取时当前间
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日-HH时mm分ss秒"
        refresh.attributedTitle = NSAttributedString(string: dateFormatter.string(from: NSDate() as Date))
        
        // 添加数据并延时2秒，假装从服务器请求
        dataArr.insert("😀😀", at: 0)
        self.perform(#selector(stopRefresh), with: self, afterDelay: 2)
    }
    
    // 停止刷新
    func stopRefresh() {
        refresh.endRefreshing()
        table.reloadData()
    }
    // tableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuse = "reuse"
        var cell: CustomTableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuse) as? CustomTableViewCell
        if cell == nil {
            cell = CustomTableViewCell(style: .default, reuseIdentifier: reuse)
        }
        cell?.setData(data: dataArr[indexPath.row])
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select index is \(String(indexPath.row))")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

