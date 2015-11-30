//
//  ViewController.m
//  05-新手引导页
//
//  Created by qingyun on 15/11/29.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置视图内容大小
    _scrollView.contentSize = CGSizeMake(3*375, 667);
    
    //设置分页
    _scrollView.pagingEnabled = YES;
    
    //设置代理
    _scrollView.delegate = self;
    
    //对pageControl 添加事件监听
    [_pageControll addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
//更改scrollView的偏移量，  显示pageControl当前页对应的图片

-(void)pageControlClick:(UIPageControl *)pageControl
{
    CGPoint offset =  CGPointMake(pageControl.currentPage *_scrollView.frame.size.width, 0);
    _scrollView.contentOffset = offset;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControll.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
