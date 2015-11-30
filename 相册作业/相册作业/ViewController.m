//
//  ViewController.m
//  相册作业
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _scrollView.contentSize =  CGSizeMake(1200, 667);
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleClick:)];
    
    //设置有效点击次数
    tap.numberOfTapsRequired = 2;
    //添加手势
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)doubleClick:(UITapGestureRecognizer *)tap
{
    //获取点击点的坐标
    CGPoint point = [tap locationInView:self.view];
    
    CGRect rect = CGRectMake(point.x - 100, point.y - 100, 200, 200);
    
    [_scrollView zoomToRect:rect animated:YES];
}


//-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return _scrollView;
//}
-(void)pageControlClick:(UIPageControl *)pageControl
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
