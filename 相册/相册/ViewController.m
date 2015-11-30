//
//  ViewController.m
//  相册
//
//  Created by qingyun on 15/11/30.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYScrollView.h"
@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scorllView;

@end

@implementation ViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define Count 3
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建并添加滚动的底部的ScrollView
    [self addScrollView];
    
    //在ScrollView上添一个ScrollView
    [self addSubViewForScrollView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, QYScreenW + 25 , QYScreenH)];
    
    [self.view addSubview:scrollView];
    
    //创建滚动窗口的大小
    scrollView.contentSize = CGSizeMake((QYScreenW + 25)*3, QYScreenH);
    
    //设置分页
    scrollView.pagingEnabled = YES;
    
    //
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //设置代理
    scrollView.delegate = self;
    
    
    _scorllView = scrollView;
    
    //设置背景颜色
    _scorllView.backgroundColor = [UIColor blackColor];
    
    
    
}

//在底部的ScrollView上添加缩放的scrollView
-(void)addSubViewForScrollView
{
    //用循环的方式创建scrollView
    for (int i = 0 ; i < Count ; i++) {
    
        QYScrollView *qyScrollView = [[QYScrollView alloc]initWithFrame:CGRectMake((QYScreenW + 25)*i, 0, QYScreenW, QYScreenH)];
        
        [_scorllView addSubview:qyScrollView];
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, QYScreenW, QYScreenH)];
//        [qyScrollView addSubview:imageView];
//        
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i + 1];
        
        qyScrollView.img = [UIImage imageNamed:imageName];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //判断当前子视图是否为UIScrollView类型
    for (id object in scrollView.subviews) {
        if ([object isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scroll = (UIScrollView *)object;
            scroll.zoomScale = 1.0;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
