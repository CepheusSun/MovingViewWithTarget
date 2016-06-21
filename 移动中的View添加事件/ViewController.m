//
//  ViewController.m
//  移动中的View添加事件
//
//  Created by 孙扬 on 16/4/16.
//  Copyright © 2016年 孙扬. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    UIButton *button_;
}
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self
               action:@selector(buttonEvent:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
//    [UIView animateWithDuration:10 animations:^{
//        //动画中事件无效
//        button.frame = CGRectMake(0, 448, 100, 100);
//
//    }];
    button.userInteractionEnabled = NO;//取消响应事件

    
    [UIView animateWithDuration:10.f
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction animations:^{
                            button.frame = CGRectMake(0, 448, 100, 100);
                        } completion:^(BOOL finished) {
    
                        }];//动画中事件在终点

    button_ = button;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    CGPoint presentPosition = [[button_.layer presentationLayer] position];
    
    if (point.x > presentPosition.x - 50 && point.x < presentPosition.x + 50 && point.y > presentPosition.y - 50 && point.y < presentPosition.y + 50) {
        NSLog(@"youxiangying");
        [self buttonEvent:button_];
    }
    
}
- (void)buttonEvent:(UIButton*)button {
    NSLog(@"aaa");
    static int flag = 0;
    flag ++;
    
    _targetLabel.text = [NSString stringWithFormat:@"%@",@(flag)];
    
}

@end










