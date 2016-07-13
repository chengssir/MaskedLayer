//
//  ViewController.swift
//  Swift 遮罩层
//
//  Created by 程国帅 on 16/7/2.
//  Copyright © 2016年 程国帅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CAShapeLayer绘制视图形状"
        
//        Swift
        let customView = customShapeImageView.init(frame: CGRectMake(10, 70, 150, 120))
        customView.image = UIImage.init(named: "image")
        customView.left = 0;
        customView.top = 120;
        self.view.addSubview(customView)
        
        
        let pentagonView = drawImageView.init(frame: CGRectMake(10, 250, 150, 120))
        pentagonView.image = UIImage.init(named: "image")
        pentagonView.left = 0;
        self.view.addSubview(pentagonView)
        
//       objective-c
        let customViewOC = customShapeImageView.init(frame: CGRectMake(200, 70, 150, 120))
        customViewOC.right = CGRectGetWidth(UIScreen.mainScreen().bounds);
        customViewOC.top = 120;
        customViewOC.image = UIImage.init(named: "image")
        self.view.addSubview(customViewOC)
 
        let pentagonViewOC = ocDrawImageView.init(frame: CGRectMake(200, 250, 150, 120))
        pentagonViewOC.shape = PentagonShape
        pentagonViewOC.right = CGRectGetWidth(UIScreen.mainScreen().bounds);
        pentagonViewOC.image = UIImage.init(named: "image")
        self.view.addSubview(pentagonViewOC)
        
        let IrregularOC = ocDrawImageView.init(frame: CGRectMake(200, 400, 150, 120))
        IrregularOC.shape = OtherShape
        IrregularOC.right = CGRectGetWidth(UIScreen.mainScreen().bounds);
        IrregularOC.image = UIImage.init(named: "image")
        self.view.addSubview(IrregularOC)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

