//
//  ViewController.m
//  04-UIScrollViewDelegate
//
//  Created by qingyun on 15/11/29.
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
    
    //设置内容视图的size
    _scrollView.contentSize = _imageView.frame.size;
    
    //设置代理
    _scrollView.delegate = self;
    
    //内容的偏移量
    [_scrollView setContentOffset:CGPointMake(100, 0) animated:YES];
    
    //设置缩放比例
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.minimumZoomScale = 0.5;
    
    //设置缩放反弹效果 默认为YES 支持缩放自由大小但是在松手之后若超出边界会变为边界值
//    _scrollView.bouncesZoom = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UIScrollViewDelegate 滚动
#if 0
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"decelerating:%d",scrollView.decelerating);
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //将要开始拖动
    NSLog(@"tracking:%d",scrollView.tracking);
}

#endif

#pragma mark - UIScrollViewDelegate  缩放
//在缩放过程中一直调用
-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"zoomScale:%f",scrollView.zoomScale);
}


//指定当前缩放的视图，写完这个之后才允许视图缩放
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
