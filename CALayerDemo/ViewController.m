//
//  ViewController.m
//  CALayerDemo
//
//  Created by zpf on 2017/6/29.
//  Copyright © 2017年 XiHeLaoBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIView *normalView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //四边都出现阴影的效果(shadowPath 用法)
    [self allShadow];
    
    //普通的用法
    [self normalUser];
}

//四边阴影(shadowPath 用法)
- (void)allShadow {
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(30, 50, 200, 200)];
    
    _contentView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_contentView];
    
    //shadowColor阴影颜色
    _contentView.layer.shadowColor = [UIColor blueColor].CGColor;
    
    //shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    _contentView.layer.shadowOffset = CGSizeMake(0,0);
    
    //阴影透明度，默认0
    _contentView.layer.shadowOpacity = 1;
    
    //阴影半径，默认3
    _contentView.layer.shadowRadius = 10;
    
    //路径阴影(借助贝塞尔曲线)
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = _contentView.bounds.size.width;
    float height = _contentView.bounds.size.height;
    float x = _contentView.bounds.origin.x;
    float y = _contentView.bounds.origin.y;
    float addWH = 10;
    
    CGPoint topLeft      = _contentView.bounds.origin;
    CGPoint topMiddle = CGPointMake(x+(width/2),y-addWH);
    CGPoint topRight     = CGPointMake(x+width,y);
    
    CGPoint rightMiddle = CGPointMake(x+width+addWH,y+(height/2));
    
    CGPoint bottomRight  = CGPointMake(x+width,y+height);
    CGPoint bottomMiddle = CGPointMake(x+(width/2),y+height+addWH);
    CGPoint bottomLeft   = CGPointMake(x,y+height);
    
    
    CGPoint leftMiddle = CGPointMake(x-addWH,y+(height/2));
    
    [path moveToPoint:topLeft];
    //添加四个二元曲线
    [path addQuadCurveToPoint:topRight
                 controlPoint:topMiddle];
    [path addQuadCurveToPoint:bottomRight
                 controlPoint:rightMiddle];
    [path addQuadCurveToPoint:bottomLeft
                 controlPoint:bottomMiddle];
    [path addQuadCurveToPoint:topLeft
                 controlPoint:leftMiddle];
    //设置阴影路径
    _contentView.layer.shadowPath = path.CGPath;
}

//基础用法
- (void)normalUser {
    _normalView = [[UIView alloc] initWithFrame:CGRectMake(30, 350, 200, 200)];
    
    _normalView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_normalView];
    
    //设置阴影颜色
    _normalView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    //设置阴影的半径
    _normalView.layer.shadowRadius = 5;
    
    //设置阴影的透明度
    _normalView.layer.shadowOpacity = 1.0;
    
    //设置阴影在bounds中的偏移量
    _normalView.layer.shadowOffset = CGSizeMake(10, 10);
}

#pragma mark - 警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
