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
    
//    
//    [UIView animateWithDuration:10 animations:^{
//        //动画中事件无效
//        button.frame = CGRectMake(0, 448, 100, 100);
//
//    }];
    button.userInteractionEnabled = NO;//取消响应事件

//    NSLog(@"%@---%p",button.layer,button.layer);
//    NSLog(@"%@---%p",button.layer.presentationLayer,button.layer.presentationLayer);
//    NSLog(@"%@---%p",button.layer.modelLayer,button.layer.modelLayer);
    [UIView animateWithDuration:10.f
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction animations:^{
//                            button.frame = CGRectMake(0, 448, 100, 100);
                            button.layer.frame = CGRectMake(0, 448, 100, 100);
                        } completion:^(BOOL finished) {
//                            NSLog(@"----%@---%p",button.layer,button.layer);
//                            NSLog(@"----%@---%p",button.layer.presentationLayer,button.layer.presentationLayer);
//                            NSLog(@"----%@---%p",button.layer.modelLayer,button.layer.modelLayer);

                        }];//动画中事件在终点
//    NSLog(@"--%@---%p",button.layer,button.layer);
//    NSLog(@"--%@---%p",button.layer.presentationLayer,button.layer.presentationLayer);
//    NSLog(@"--%@---%p",button.layer.modelLayer,button.layer.modelLayer);
    
    NSLog(@"outside animation block: %@",
          [button actionForLayer:button.layer forKey:@"position"]);
    
    [UIView animateWithDuration:0.3 animations:^{
        NSLog(@"inside animation block: %@",
              [button actionForLayer:button.layer forKey:@"position"]);
    }];
    
//    CALayer *layer = [[CALayer alloc] init];
//    layer.frame = CGRectMake(20, 20, 50, 50);
//    layer.backgroundColor = [UIColor blackColor].CGColor;
//    UIImage *image = [UIImage imageNamed:@"test.jpg"];
//    layer.contents = (__bridge id)image.CGImage;
//    [button.layer addSublayer:layer];
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.frame = CGRectMake(20, 20, 50, 50);
//    [button addSubview:imageView];
//    imageView.userInteractionEnabled = NO;
    
    button_ = button;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    if (CGRectContainsPoint(button_.layer.presentationLayer.frame, point)) {
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








