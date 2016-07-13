//
//  CCImageView.h
//  Mask_layer_Demo
//
//  Created by 程国帅 on 15/6/24.
//  Copyright (c) 2015年 程国帅. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *    注意事项：
 *    如需要使用贝塞尔曲线画出相应的形状需打开注释掉的代码
 *    //- (void)setImage:(UIImage *)image
 *    如果是根据图片形状画出Layer的形状请注释
 */


typedef enum {
    OtherShape,//其他
    PentagonShape,//五角形
    ScoopShape//椭、圆形
} ViewShape;

@interface ocDrawImageView : UIImageView

@property(nonatomic, assign) ViewShape shape;

@end


@interface customShapeImageView : UIImageView


@end