//
//  TJAiToPathTool.h
//  MusicPath
//
//  Created by 唐京 on 2017/10/17.
//  Copyright © 2017年 town. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TJAiToPathTool : NSObject
+ (UIBezierPath *)convertAiToPathWith:(NSString *)fileName withTargetFrame:(CGRect)targetFrame;
@end
