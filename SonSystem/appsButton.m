//
//  appsButton.m
//  SonSystem
//
//  Created by 浮云漫步 on 16/6/26.
//  Copyright © 2016年 iphone. All rights reserved.
//

#import "appsButton.h"

@implementation appsButton
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.frame=CGRectMake(0, 0, self.width, self.height-25);
        self.titleLabel.frame = CGRectMake(0, 0, self.imageView.width, self.height-25);
    }
    return self;
}

//修改按钮内部子控件的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height - 25);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, self.imageView.height, contentRect.size.width, 25);
}

@end
