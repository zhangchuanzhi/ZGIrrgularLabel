//
//  ZGIrregularLabel.m
//  ZGIrrgularLabel
//
//  Created by offcn_zcz32036 on 2018/4/2.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ZGIrregularLabel.h"
@interface ZGIrregularLabel()

/** 遮罩 */
@property (nonatomic, strong) CAShapeLayer *maskLayer;
/** 路径 */
@property (nonatomic, strong) UIBezierPath *borderPath;
@end
@implementation ZGIrregularLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.maskLayer=[CAShapeLayer layer];
        [self.layer setMask:self.maskLayer];
        self.borderPath=[UIBezierPath bezierPath];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 遮罩层frame
    self.maskLayer.frame = self.bounds;

    // 设置path起点
    [self.borderPath moveToPoint:CGPointMake(0, 10)];
    // 左上角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(10, 0) controlPoint:CGPointMake(0, 0)];
    // 直线，到右上角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width - 10, 0)];
    // 右上角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(self.bounds.size.width, 10) controlPoint:CGPointMake(self.bounds.size.width, 0)];
    // 直线，到右下角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    // 底部的小三角形
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2+5, self.bounds.size.height)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height-5)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2 - 5, self.bounds.size.height)];
    // 直线，到左下角
    [self.borderPath addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    // 直线，回到起点
    [self.borderPath addLineToPoint:CGPointMake(0, 10)];

    // 将这个path赋值给maskLayer的path
    self.maskLayer.path = self.borderPath.CGPath;
}

@end
