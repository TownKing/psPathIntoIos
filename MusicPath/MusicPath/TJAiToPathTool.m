//
//  TJAiToPathTool.m
//  MusicPath
//
//  Created by 唐京 on 2017/10/17.
//  Copyright © 2017年 town. All rights reserved.
//

#import "TJAiToPathTool.h"

@implementation TJAiToPathTool
+ (UIBezierPath *)convertAiToPathWith:(NSString *)fileName withTargetFrame:(CGRect)targetFrame{
    float rate = 1.0;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    NSString *source = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"ai"] encoding:NSUTF8StringEncoding error:nil];
    NSArray *lines = [source componentsSeparatedByString:@"\r"];
    float height = 0;
    
    
    CGPoint startPoint = CGPointZero;
    
    for (int i=0; i<lines.count; i++) {
        NSString *line = [lines objectAtIndex:i];
        if ([line containsString:@"BoundingBox"]) {
            NSArray *elements = [line componentsSeparatedByString: @" "];
            height = [[elements lastObject] floatValue];
            
            rate = targetFrame.size.height / height ;
        }
        
        
        NSArray *elements = [line componentsSeparatedByString: @" "];
        
        if ([[elements lastObject] isEqualToString:@"m"]) {
            
            [path moveToPoint:CGPointMake([elements[0] floatValue]*rate, (height - [elements[1] floatValue])*rate)];
            startPoint = CGPointMake([elements[0] floatValue]*rate, (height - [elements[1] floatValue])*rate);
            
        }else if([[elements lastObject] isEqualToString:@"v"]){
            CGPoint c1 = startPoint;
            CGPoint c2 = CGPointMake([elements[0] floatValue]*rate, (height - [elements[1] floatValue])*rate);
            
            [path addCurveToPoint:CGPointMake([elements[2] floatValue]*rate, (height - [elements[3] floatValue])*rate) controlPoint1:c2 controlPoint2:c1];
            
        }else if([[elements lastObject] isEqualToString:@"c"] || [[elements lastObject] isEqualToString:@"C"]){
            CGPoint c1 = CGPointMake([elements[2] floatValue]*rate, (height - [elements[3] floatValue])*rate);
            CGPoint c2 = CGPointMake([elements[0] floatValue]*rate, (height - [elements[1] floatValue])*rate);
            [path addCurveToPoint:CGPointMake([elements[4] floatValue]*rate, (height - [elements[5] floatValue])*rate) controlPoint1:c2 controlPoint2:c1];
            
        }else if ([[elements lastObject] isEqualToString:@"L"]) {
            
            [path addLineToPoint:CGPointMake([elements[0] floatValue]*rate, (height - [elements[1] floatValue])*rate)];
            
        }
    }
    return path;
}
@end
