//
//  tabViewCell.swift
//  Swift_控件1
//
//  Created by 程国帅 on 16/6/24.
//  Copyright © 2016年 程国帅. All rights reserved.
//

import UIKit

enum ShapeType{
    case swift_Custom
    case swift_Pentagone
}

class tabViewCell: UITableViewCell {
 
    var isMySelf :Bool?
    var bubbleImageView : customShapeImageView?
    var headImageView : UIImageView?

    override func layoutSubviews() {
     
        if isMySelf == true {
            bubbleImageView?.Custom("chat_Bubble_Myself.tiff")
            headImageView?.right = UIScreen.main.bounds.width - 10
            bubbleImageView?.right = (headImageView?.left)! - 10

        }else{
            bubbleImageView?.Custom("chat_Bubble_Friend.tiff")
            headImageView?.left = 10
            bubbleImageView?.left = (headImageView?.right)! + 10

        }

    }
    
    fileprivate func prepareUI(_ shareT : ShapeType) {
        
        switch shareT {
        case .swift_Custom:
            bubbleImageView = customShapeImageView.init(frame: CGRect(x: 0, y: 10, width: 120, height: 180))
            break
        case .swift_Pentagone:
            bubbleImageView = drawImageView.init(frame: CGRect(x: 0, y: 10, width: 120, height: 180))
            break
        }
        
        bubbleImageView!.image = UIImage.init(named: "image")
        self.contentView.addSubview(bubbleImageView!)

        headImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        headImageView!.image = UIImage.init(named: "ios_profile")
        self.contentView.addSubview(headImageView!)


    }
 
    init(style: UITableViewCellStyle, reuseIdentifier: String? , shareT : ShapeType) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI(shareT)
  
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
}
