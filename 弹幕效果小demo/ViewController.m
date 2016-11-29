//
//  ViewController.m
//  弹幕效果小demo
//
//  Created by lzb on 16/3/22.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(initDate) userInfo:nil repeats:YES];

}
-(void)initDate
{
    NSArray *danmakus = @[@"1",@"1edfsf",@"1fdsfsf",@"1rtyjty45",@"1weqr3r3r3r",@"33333331",@"oooooooooo1",@"sdfgs1",@"1fgdsgf",@"1dsfsdg"];
    NSString *str = [danmakus objectAtIndex:rand()%danmakus.count];
    UILabel *label = [[UILabel alloc]init];
    label.frame =CGRectMake(320, rand()%290, 250, 30);
    label.text = str;
    label.textColor = [self randomColor];
    //将label加入本视图中去。
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    [self move:label];
    
}
-(void)move:(UILabel*)_label
{
    [UIView animateWithDuration:5 animations:^{
        _label.frame = CGRectMake(-250, _label.frame.origin.y, _label.frame.size.width, _label.frame.size.height);
    } completion:^(BOOL finished) {
        [_label removeFromSuperview];
    }
     ];
}
-(UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
