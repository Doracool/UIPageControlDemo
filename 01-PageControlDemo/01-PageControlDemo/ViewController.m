//
//  ViewController.m
//  01-PageControlDemo
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置总的PageControl的页数
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    [self.view addSubview:pageControl];
    pageControl.backgroundColor = [UIColor lightGrayColor];
    
    //设置的总页数
    pageControl.numberOfPages = 5;
    //设置当前的页数
    pageControl.currentPage = 2;
    //设置未被选中的颜色
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    //设置选中的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    pageControl.defersCurrentPageDisplay = YES;
    
    [pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)pageControlClick:(UIPageControl *)pageControl
{
    [pageControl performSelector:@selector(updateCurrentPageDisplay) withObject:nil afterDelay:2];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
