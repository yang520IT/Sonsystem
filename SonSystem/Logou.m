//
//  zhihu.m
//  知乎
//
//  Created by 浮云漫步 on 16/5/23.
//  Copyright © 2016年 iphone. All rights reserved.
//

#import "Logou.h"
@interface Logou ()
@property(nonatomic,assign)CGFloat end;
@property(nonatomic,strong)NSTimer *timer;
@end
@implementation Logou


- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.origin.x + rect.size.width * 0.5, rect.origin.y + rect.size.width * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 5;
    


    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:M_PI_2 endAngle:self.end clockwise:YES];
    path.lineWidth = 4;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor whiteColor]set];
    [path stroke];
   
    CGFloat radius1 = rect.size.width * 0.5 - 15;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius1 startAngle:M_PI_2 endAngle:self.end clockwise:YES];
    path1.lineCapStyle = kCGLineCapRound;
    [[UIColor whiteColor]set];
    [path1 stroke];

}
- (void)awakeFromNib{
    self.end = M_PI_2;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(newView) userInfo:nil repeats:YES];
    self.timer = timer;
     });
}
- (void)newView{
    self.end += 0.12;
    [self setNeedsDisplay];
    if (self.end >= 7.7) {
        [self.timer invalidate];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [self.superview.superview removeFromSuperview];
        });
    }
}

@end
