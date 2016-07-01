//
//  ViewController.m
//  SonSystem
//
//  Created by 浮云漫步 on 16/6/26.
//  Copyright © 2016年 iphone. All rights reserved.
//

#import "ViewController.h"
#import "XLSphereView.h"

@interface ViewController ()

@property (nonatomic,strong) XLSphereView *sphereView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupApps];
}
- (void)setupApps{
    CGFloat sphereViewH = [UIScreen mainScreen].bounds.size.height / 3 + 20;
    CGFloat sphereViewW = sphereViewH;
    CGFloat sphereViewX = ([UIScreen mainScreen].bounds.size.width - sphereViewH) / 2;
    _sphereView = [[XLSphereView alloc] initWithFrame:CGRectMake(sphereViewX, 50, sphereViewW, sphereViewH)];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i = 0; i < 20; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        //[btn setTitle:[NSString stringWithFormat:@"浮云漫步"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_04"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        btn.frame = CGRectMake(0, 0, 55, 55);
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:btn];
        [_sphereView addSubview:btn];
    }
    [_sphereView setItems:array];
    [self.view addSubview:_sphereView];
}
- (void)buttonPressed:(UIButton *)btn
{
    [_sphereView timerStop];
    _sphereView.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.3 animations:^{
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {

        [UIView animateWithDuration:0.3 animations:^{
            btn.transform = CGAffineTransformMakeScale(1., 1.);
        } completion:^(BOOL finished) {
            
            _sphereView.userInteractionEnabled = YES;
            [_sphereView timerStart];
        }];
    }];
}
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
@end
