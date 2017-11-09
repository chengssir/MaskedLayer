//
//  bubbleView.swift
//  Swift 遮罩层
//
//  Created by 程国帅 on 16/7/2.
//  Copyright © 2016年 程国帅. All rights reserved.
//

import UIKit


class customShapeImageView: UIImageView {
    var maskLayer : CAShapeLayer?

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func Custom(_ imageName : NSString) {
        //http://www.kancloud.cn/manual/ios/97766
        maskLayer = CAShapeLayer()
        maskLayer!.frame = self.bounds
        maskLayer?.contentsScale = UIScreen.main.scale//像素尺寸和视图大小的比例 3.0
        maskLayer?.contentsCenter = CGRect(x: 0.7, y: 0.7, width: 0.1, height: 0.1)//可以用来定义全面拉伸的范围
        maskLayer?.contents = UIImage.init(named: imageName as String)?.cgImage
        self.layer.mask = maskLayer
    }
    
}

class drawImageView: customShapeImageView {

    var contentLayer : CALayer?

    override var image: UIImage?{
        get {
        return super.image
        }
        set {
            contentLayer!.contents = newValue!.cgImage;
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.Pentagon()
    }
   
    //圆形或者是椭圆  看你设置的ImageView形状
    func ScoopShape() {

        maskLayer = CAShapeLayer()

        let path = UIBezierPath(ovalIn:self.bounds)
        /**
         *  也是可以绘制圆形以及椭圆
         *  @param self.bounds 当前View的大小
         *  @param 100         半径
         *
         */
        //let path = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: 100)

        maskLayer?.path = path.cgPath
        maskLayer?.fillColor = UIColor.black.cgColor
        maskLayer?.strokeColor = UIColor.red.cgColor// 边缘线的颜色
        maskLayer?.contentsCenter = CGRect(x: 0.5, y: 0.5, width: 0.1, height: 0.1)
        maskLayer?.contentsScale = UIScreen.main.scale
        maskLayer!.frame = self.bounds

        contentLayer = CALayer()
        contentLayer!.mask = maskLayer
        contentLayer!.frame = self.bounds
        self.layer.addSublayer(contentLayer!)
    }
    
    //五角形
    func Pentagon() {
        
        maskLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50.0, y: 2.0))
        path.addLine(to: CGPoint(x: 84.0, y: 86.0))
        path.addLine(to: CGPoint(x: 6.0, y: 33.0))
        path.addLine(to: CGPoint(x: 96.0, y: 33.0))
        path.addLine(to: CGPoint(x: 17.0, y: 86.0))
        path.close()
        
        maskLayer?.path = path.cgPath
        maskLayer?.fillColor = UIColor.black.cgColor
        maskLayer?.strokeColor = UIColor.red.cgColor
        maskLayer?.contentsCenter = CGRect(x: 0.5, y: 0.5, width: 0.1, height: 0.1)
        maskLayer?.contentsScale = UIScreen.main.scale
        maskLayer!.frame = self.bounds
        
        
        contentLayer = CALayer()
        contentLayer!.mask = maskLayer
        contentLayer!.frame = self.bounds
        self.layer.addSublayer(contentLayer!)
    }
    
  
    
}




