//
//  tabViewCell.swift
//  Swift_控件1
//
//  Created by 程国帅 on 16/6/24.
//  Copyright © 2016年 程国帅. All rights reserved.
//

import UIKit

class tabViewCell: UITableViewCell {
 
    var isMySelf :Bool?
    var bubbleImageView : customShapeImageView?
    var headImageView : UIImageView?

    override func layoutSubviews() {
     
        if isMySelf == true {
            bubbleImageView?.Custom("chat_Bubble_Myself.tiff")
            headImageView?.right = UIScreen.mainScreen().bounds.width - 10
            bubbleImageView?.right = (headImageView?.left)! - 10

        }else{
            bubbleImageView?.Custom("chat_Bubble_Friend.tiff")
            headImageView?.left = 10
            bubbleImageView?.left = (headImageView?.right)! + 10

        }

    }
    
    private func prepareUI() {
        bubbleImageView = customShapeImageView.init(frame: CGRectMake(0, 10, 120, 180))
        bubbleImageView!.image = UIImage.init(named: "image")
        self.contentView.addSubview(bubbleImageView!)
        
        headImageView = UIImageView.init(frame: CGRectMake(0, 0, 44, 44))
        headImageView!.image = UIImage.init(named: "ios_profile")
        self.contentView.addSubview(headImageView!)

    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareUI()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
}
