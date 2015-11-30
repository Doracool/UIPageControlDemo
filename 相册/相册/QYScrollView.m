//
//  QYScrollView.m
//  相册
//
//  Created by qingyun on 15/11/30.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYScrollView.h"

@interface QYScrollView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIImageView *imageView;
@end
@implementation QYScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        
        [self addSubview:imageView];
        _imageView = imageView;
        
        //设置当前的代理
        self.delegate = self;
        //设置缩放范围
        self.maximumZoomScale = 2.0;
        self.minimumZoomScale = 0.5;
        
        //添加双击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleClick:)];
        
        //设置有效点击数
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}


-(void)doubleClick:(UITapGestureRecognizer *)tap{
    //当前的缩放比例不等于1.0
    if (self.zoomScale != 1.0) {
        self.zoomScale = 1.0;
        return;
    }
    //当前的缩放比例等于1.0
    CGPoint point = [tap locationInView:self];
    
    //创建一个矩形区域
    CGRect rect = CGRectMake(point.x- 100, point.y - 100, 200, 200);
    
    [self zoomToRect:rect animated:YES];
}
-(void)setImg:(UIImage *)img
{
    //设置img属性
    _img = img;
    //设置imageView的image
    _imageView.image = img;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}
@end
