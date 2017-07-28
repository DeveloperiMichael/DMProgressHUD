//
//  ViewController.m
//  DMProgressHUD
//
//  Created by 张炯 on 2017/7/18.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <Masonry/Masonry.h>
#import "DMProgressHUD.h"

@interface ViewController ()
{
    int _a;
    
}


@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.label];
    [self.bgView addSubview:self.detailLabel];
    
//    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.bgView);
//        make.height.mas_equalTo(40);
//        make.width.lessThanOrEqualTo(self.bgView).mas_offset(-10);
//    }];
//    
//    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.bgView);
//        make.top.mas_equalTo(_label.mas_bottom).mas_offset(10);
//        make.height.mas_equalTo(40);
//        make.width.lessThanOrEqualTo(self.bgView).mas_offset(-10);
//    }];
//    
//    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.height.mas_equalTo(200);
//        make.width.mas_equalTo(200).priorityLow();
//        make.width.lessThanOrEqualTo(self.view).mas_offset(-20);
//    }];
    
    DMProgressHUD *hud = [[DMProgressHUD alloc] initWithShowInView:self.view];
    [hud showAfterDelay:0.0 animated:YES];
    [hud hideAfterDelay:3.0 animated:YES];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor redColor];
    }
    return _bgView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.text = @"";
        _label.backgroundColor = [UIColor brownColor];
    }
    return _label;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.text = @"";
        _detailLabel.backgroundColor = [UIColor brownColor];
    }
    return _detailLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
