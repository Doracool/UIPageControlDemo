//
//  ViewController.m
//  03-UIScrollViewScrollToTop
//
//  Created by qingyun on 15/11/27.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置滚动大小
    _scrollView.contentSize = _imageView.frame.size;
    
    //属性滚动到顶部
    _scrollView.scrollsToTop = YES;
    
    //设置代理
    _scrollView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UIScrollViewDelegate

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
