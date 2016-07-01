//
//  defaultView.m
//  知乎
//
//  Created by 浮云漫步 on 16/5/23.
//  Copyright © 2016年 iphone. All rights reserved.
//

#import "defaultView.h"
@interface defaultView ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonLayout;

@end
@implementation defaultView
- (void)awakeFromNib{
    self.buttonLayout.constant = 0;
    [UIView animateWithDuration:0.7 animations:^{
        [self layoutIfNeeded];
    }];
}
+ (instancetype)show{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

@end
