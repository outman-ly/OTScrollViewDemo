//
//  ViewController.m
//  OTScrollViewDemo
//
//  Created by OUT MAN on 16/3/17.
//  Copyright © 2016年 OUT MAN. All rights reserved.
//

#import "ViewController.h"

#define kScreenSize [UIScreen mainScreen].bounds.size
// leftView的宽度 topView的高度
#define kBarSpace 50

#define kContentW 1000
#define kContentH 1000

@interface ViewController ()<UIScrollViewDelegate> {
    
    UIScrollView *_scrollView;
    UIView *_topView;
    UIView *_leftView;
    UIView *_contentView;
    UIView *_shadeView;
    
    UILabel *_tLable1;
    UILabel *_tLabel2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height)];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor cyanColor];
    
    _scrollView.bounces = NO;
    
    [self.view addSubview:_scrollView];
    
    
    // 右下角
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(kBarSpace, kBarSpace, kContentW, kContentH)];
    _contentView.backgroundColor = [UIColor purpleColor];
    [_scrollView addSubview:_contentView];
    
    // 添加个图片(右下)
    UIImageView *imageViewR = [[UIImageView alloc] initWithFrame:_contentView.bounds];
    NSString *imgStr = [[NSBundle mainBundle] pathForResource:@"1.png" ofType:nil];
    imageViewR.image = [UIImage imageWithContentsOfFile:imgStr];
    imageViewR.contentMode = UIViewContentModeScaleToFill;
    [_contentView addSubview:imageViewR];
    
    // 顶部
    _topView = [[UIView alloc] initWithFrame:CGRectMake(kBarSpace, 0, kContentW, kBarSpace)];
    _topView.backgroundColor = [UIColor yellowColor];
    [_scrollView addSubview:_topView];
    
    // 左边
    _leftView = [[UIView alloc] initWithFrame:CGRectMake(0, kBarSpace, kBarSpace, kContentH)];
    _leftView.backgroundColor = [UIColor orangeColor];
    [_scrollView addSubview:_leftView];
    
    // 左上角
    _shadeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kBarSpace, kBarSpace)];
    _shadeView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_shadeView];
    
    // 添加个图片(左上)
    UIImageView *imageViewL = [[UIImageView alloc] initWithFrame:_shadeView.bounds];
    imageViewL.image = [UIImage imageWithContentsOfFile:imgStr];
    imageViewL.contentMode = UIViewContentModeScaleToFill;
    [_shadeView addSubview:imageViewL];
    
    
    _scrollView.contentSize = CGSizeMake(kContentW + kBarSpace, kContentH + kBarSpace);
    
    
    // 填充label
    _tLable1 = [[UILabel alloc] initWithFrame:CGRectMake(kBarSpace, 0, kContentW, kBarSpace)];
    _tLable1.textAlignment = NSTextAlignmentCenter;
    _tLable1.textColor = [UIColor redColor];
    _tLable1.numberOfLines = 1;
    _tLable1.text = @"We must accept finite disappointment, but we must never lose infinite hope   ---  Mattin Luther King";
    [_topView addSubview:_tLable1];
    
    _tLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(-kContentW * 0.5 + kBarSpace * 0.5, kContentH * 0.5 + kBarSpace * 0.5, kContentW, kBarSpace)];
    _tLabel2.transform = CGAffineTransformMakeRotation(-M_PI_2);
    _tLabel2.textAlignment = NSTextAlignmentCenter;
    _tLabel2.textColor = [UIColor redColor];
    _tLabel2.numberOfLines = 1;
    _tLabel2.text = @"Fear not that the life shall come to an end, but rather fear that it shall never have a beginning   ---   J.H. Newman";
    [_leftView addSubview:_tLabel2];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGRect topViewFrame = _topView.frame;
    topViewFrame.origin.y = scrollView.contentOffset.y;
    _topView.frame = topViewFrame;
    
    
    CGRect leftViewFrame = _leftView.frame;
    leftViewFrame.origin.x = scrollView.contentOffset.x;
    _leftView.frame = leftViewFrame;
    
    
    CGRect shadeViewFrame = _shadeView.frame;
    shadeViewFrame.origin.x = scrollView.contentOffset.x;
    shadeViewFrame.origin.y = scrollView.contentOffset.y;
    _shadeView.frame = shadeViewFrame;
    
}

@end