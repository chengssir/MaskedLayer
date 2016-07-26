//
//  CCImageView.m
//  Mask_layer_Demo
//
//  Created by 程国帅 on 15/6/24.
//  Copyright (c) 2015年 程国帅. All rights reserved.
//

#import "ocDrawImageView.h"

@interface ocDrawImageView()
{
    CALayer      *_contentLayer;
    CAShapeLayer *_maskLayer;
}
@end

@implementation ocDrawImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)setShape:(ViewShape)shape
{
    _shape = shape;
    switch (shape) {
        case PentagonShape:
        {
            [self Pentagon];
        }
            break;
        case ScoopShape:
        {
            [self ScoopShape];
  
        }
            break;
        default:
            
            [self Irregular];
            
            break;
    }
    
    
}

//绘制圆角
- (void)ScoopShape
{
    _maskLayer = [CAShapeLayer layer];
//同Swift方法
//    _maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:50].CGPath;
    _maskLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    _maskLayer.fillColor = [UIColor blackColor].CGColor;
    _maskLayer.strokeColor = [UIColor redColor].CGColor;
    _maskLayer.frame = self.bounds;
    _maskLayer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
    _maskLayer.contentsScale = [UIScreen mainScreen].scale;
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.bounds;
    [self.layer addSublayer:_contentLayer];
    
}
//五角形
- (void)Pentagon
{
    _maskLayer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50.0, 2.0);
    CGPathAddLineToPoint(path, NULL, 84, 86);
    CGPathAddLineToPoint(path, NULL, 6.0, 33.0);
    CGPathAddLineToPoint(path, NULL, 96.0, 33.0);
    CGPathAddLineToPoint(path, NULL, 17.0, 86.0);
    CGPathAddLineToPoint(path, NULL, 50.0, 2.0);
    _maskLayer.path = path;

    _maskLayer.fillColor = [UIColor blackColor].CGColor;
    _maskLayer.strokeColor = [UIColor redColor].CGColor;
    _maskLayer.frame = self.bounds;
    _maskLayer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
    _maskLayer.contentsScale = [UIScreen mainScreen].scale;                 //非常关键设置自动拉伸的效果且不变形
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.bounds;
    [self.layer addSublayer:_contentLayer];
    
}
//绘制其他形状
- (void)Irregular
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint origin = self.bounds.origin;
    CGFloat radius = CGRectGetWidth(self.bounds) / 2;
    CGPathMoveToPoint(path, NULL, origin.x, origin.y + 2 *radius);
    CGPathMoveToPoint(path, NULL, origin.x, origin.y + radius);
    
    CGPathAddArcToPoint(path, NULL, origin.x, origin.y, origin.x + radius, origin.y, radius);
    CGPathAddArcToPoint(path, NULL, origin.x + 2 * radius, origin.y, origin.x + 2 * radius, origin.y + radius, radius);
    CGPathAddArcToPoint(path, NULL, origin.x + 2 * radius, origin.y + 2 * radius, origin.x + radius, origin.y + 2  * radius, radius);
    CGPathAddLineToPoint(path, NULL, origin.x, origin.y + 2 * radius);
    
    _maskLayer = [CAShapeLayer layer];
    _maskLayer.path = path;
    _maskLayer.fillColor = [UIColor blackColor].CGColor;
    _maskLayer.strokeColor = [UIColor clearColor].CGColor;
    _maskLayer.frame = self.bounds;
    _maskLayer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
    _maskLayer.contentsScale = [UIScreen mainScreen].scale;                 //非常关键设置自动拉伸的效果且不变形
    
    _contentLayer = [CALayer layer];
    _contentLayer.mask = _maskLayer;
    _contentLayer.frame = self.bounds;
    [self.layer addSublayer:_contentLayer];
    
}

//非（图片遮罩时使用）    使用图片遮罩不可用
- (void)setImage:(UIImage *)image
{
    _contentLayer.contents = (id)image.CGImage;

}

@end


@interface ocCustomShapeImageView()
{
    CAShapeLayer *_maskLayer;
}
@end

@implementation ocCustomShapeImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self PictureShape];
    }
    return self;
}

//使用图片来遮罩
- (void)PictureShape
{
    _maskLayer = [CAShapeLayer layer];
    _maskLayer.frame = self.bounds;
    _maskLayer.contentsScale = [UIScreen mainScreen].scale;
    _maskLayer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
    _maskLayer.contents = (id)[UIImage imageNamed:@"communication_chat_right.png"].CGImage;
    [self.layer setMask:_maskLayer];
}

@end
