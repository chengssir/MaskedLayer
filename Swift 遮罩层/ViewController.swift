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
            array.addObject("\(arc4random()%2)")
        }

        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorStyle = .None
        self.tableView.registerClass(tabViewCell.self, forCellReuseIdentifier: "cell")
        
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}


extension ViewController :UITableViewDataSource ,UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let index: String  = array.objectAtIndex(indexPath.row) as! String
        print(index)

        if index ==  "0" {
            return 200
        }
        
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let index: String  = array.objectAtIndex(indexPath.row) as! String

        let cell = tabViewCell.init(style: .Default, reuseIdentifier: "cell" ,shareT:index == "0" ? .Swift_Custom : .Swift_Pentagone )
        cell.backgroundColor = index == "0" ? UIColor.clearColor() : UIColor.clearColor()
        cell.selectionStyle = .None
        print("\(indexPath.row % 2)")
        cell.isMySelf = indexPath.row % 2 == 0 ? true : false
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print(indexPath.row)
    }
    
    
}

