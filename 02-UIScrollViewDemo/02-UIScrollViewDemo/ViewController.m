//
//  ViewController.m
//  02-UIScrollViewDemo
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置scrollView的背景颜色
    _ScrollView.backgroundColor = [UIColor orangeColor];
    
    //设置contentsize里边内容的大小，也就是滚动效果，默认0 没有效果
    _ScrollView.contentSize = _imageView.frame.size;
    
    //设置内容的偏移量  即最初始的偏移量 在进行拖动后不再触发这种效果
//    _ScrollView.contentOffset = CGPointMake(100, -100);
    
    //在原有的基础上更改原有的视图 上左下右 此种可以在更改滞后也保留这种效果
//    _ScrollView.contentInset = UIEdgeInsetsMake(0, 10, 10, 100);
    
    //锁定方向  即在进行左右拖动的时候不允许上下拖动和在进行上下拖动的时候不允许左右拖动
//    _ScrollView.directionalLockEnabled = YES;
    
    //超出边界 反弹效果  默认为YES即在拖动到边界可继续拖可以看见背景，而设置为NO 的时候在到边界的时候则不允许继续拖动
    _ScrollView.bounces = YES;
    
    
    //默认值为NO 假如是YES且bounces也为YES 甚至内容大小小于bounds的时候，允许拖动
    _ScrollView.alwaysBounceVertical = YES;//允许垂直拖动
    _ScrollView.alwaysBounceHorizontal = YES;//允许水平拖动
    
    //分页  即在拖动的时候只有拖动当前视图的过一定的位置才会到下个界面否则的话还是会在原来的界面
    _ScrollView.pagingEnabled = YES;
    
    //允许滚动 设置为NO之后就不允许屏幕上的内容进行滚动了
    _ScrollView.scrollEnabled = YES;
    
    //显示滚动条
    _ScrollView.showsHorizontalScrollIndicator = YES;//水平方向的滚动条
    _ScrollView.showsVerticalScrollIndicator = YES;//垂直方向的滚动条
    
    //滚动条位置  (垂直距上面的高度，水平距左边的距离，水平条距地步的高度，垂直条距右边的高度)
    _ScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //滚动条样式  颜色有黑有白
    _ScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    
     //设置减速率
    _ScrollView.decelerationRate = 100;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
