//
//  TJMusicPathView.m
//  MusicPath
//
//  Created by 唐京 on 2017/9/28.
//  Copyright © 2017年 town. All rights reserved.
//

#import "TJMusicPathView.h"
#import "TJAiToPathTool.h"

@interface TJMusicPathView(){
    UIBezierPath *mPath;
    CAShapeLayer *shapeLayer;
}

@end
IB_DESIGNABLE
@implementation TJMusicPathView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    mPath = [TJAiToPathTool convertAiToPathWith:@"r" withTargetFrame:self.bounds];
   
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = mPath.CGPath;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.lineWidth = 2.0;
    shapeLayer.lineJoin = @"round";
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeStart = 0.0f;
    shapeLayer.strokeEnd = 1.0f;
    [self.layer addSublayer:shapeLayer];
    shapeLayer.hidden = true;
    
}

- (void)animate{
    
   
    shapeLayer.hidden = false;
    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimation.duration = 10.0f;
    checkAnimation.fromValue = @(0.0f);
    checkAnimation.toValue = @(1.0f);
    [shapeLayer addAnimation:checkAnimation forKey:@"strokeEndAnimation"];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


@end
