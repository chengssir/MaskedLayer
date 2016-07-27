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
    
    func Custom(imageName : NSString) {
        //http://www.kancloud.cn/manual/ios/97766
        maskLayer = CAShapeLayer()
        maskLayer!.frame = self.bounds
        maskLayer?.contentsScale = UIScreen.mainScreen().scale//像素尺寸和视图大小的比例 3.0
        maskLayer?.contentsCenter = CGRectMake(0.7, 0.7, 0.1, 0.1)//可以用来定义全面拉伸的范围
        maskLayer?.contents = UIImage.init(named: imageName as String)?.CGImage
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
            contentLayer!.contents = newValue!.CGImage;
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

        let path = UIBezierPath(ovalInRect:self.bounds)
        /**
         *  也是可以绘制圆形以及椭圆
         *  @param self.bounds 当前View的大小
         *  @param 100         半径
         *
         */
        //let path = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: 100)

        maskLayer?.path = path.CGPath
        maskLayer?.fillColor = UIColor.blackColor().CGColor
        maskLayer?.strokeColor = UIColor.redColor().CGColor// 边缘线的颜色
        maskLayer?.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1)
        maskLayer?.contentsScale = UIScreen.mainScreen().scale
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
        path.moveToPoint(CGPointMake(50.0, 2.0))
        path.addLineToPoint(CGPointMake(84.0, 86.0))
        path.addLineToPoint(CGPointMake(6.0, 33.0))
        path.addLineToPoint(CGPointMake(96.0, 33.0))
        path.addLineToPoint(CGPointMake(17.0, 86.0))
        path.closePath()
        
        maskLayer?.path = path.CGPath
        maskLayer?.fillColor = UIColor.blackColor().CGColor
        maskLayer?.strokeColor = UIColor.redColor().CGColor
        maskLayer?.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1)
        maskLayer?.contentsScale = UIScreen.mainScreen().scale
        maskLayer!.frame = self.bounds
        
        
        contentLayer = CALayer()
        contentLayer!.mask = maskLayer
        contentLayer!.frame = self.bounds
        self.layer.addSublayer(contentLayer!)
    }
    
  
    
}




