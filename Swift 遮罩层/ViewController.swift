//
//  ViewController.swift
//  Swift 遮罩层
//
//  Created by 程国帅 on 16/7/2.
//  Copyright © 2016年 程国帅. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var array : NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CAShapeLayer绘制视图形状"
        
        self.array = NSMutableArray()
        for _ in 0..<20 {
            // 字典转模型并将模型添加到模型数组中
            array.add("\(arc4random()%2)")
        }

        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.separatorStyle = .none
        self.tableView.register(tabViewCell.self, forCellReuseIdentifier: "cell")
        
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}


extension ViewController :UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index: String  = array.object(at: (indexPath as NSIndexPath).row) as! String
        print(index)

        if index ==  "0" {
            return 200
        }
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index: String  = array.object(at: (indexPath as NSIndexPath).row) as! String

        let cell = tabViewCell.init(style: .default, reuseIdentifier: "cell" ,shareT:index == "0" ? .swift_Custom : .swift_Pentagone )
        cell.backgroundColor = index == "0" ? UIColor.clear : UIColor.clear
        cell.selectionStyle = .none
        print("\((indexPath as NSIndexPath).row % 2)")
        cell.isMySelf = (indexPath as NSIndexPath).row % 2 == 0 ? true : false
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print((indexPath as NSIndexPath).row)
    }
    
    
}

