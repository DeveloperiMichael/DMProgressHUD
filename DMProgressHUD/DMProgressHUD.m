//
//  DMProgressHUD.m
//  DMProgressHUD
//
//  Created by 张炯 on 2017/7/26.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import "DMProgressHUD.h"
#import <Masonry/Masonry.h>


@interface DMProgressHUD()

@property (nonatomic, strong) UIView *backgroundView;

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UIView *accessory;

@property (nonatomic, weak) UIView *showInView;

@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@end

@implementation DMProgressHUD

- (instancetype)initWithShowInView:(UIView *)inView {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, inView.bounds.size.width, inView.bounds.size.height);
        [self setupData];
        NSAssert(inView, @"inView must not be nil");
        _showInView = inView;
        [self setupSubviewsContrains];
        [inView addSubview:self];
        self.alpha = 0.0;
        //[self setSubviewsBackgroundColor];
    }
    return self;
}

#pragma mark -
#pragma mark -  Private Methods

- (void)setupData {
    self.hudMode = 0;
    self.animationType = 0;
    _message = @"正在加载...";
    //_detailInfo = @"请稍后";
    self.showDuration = 2.5;
}


- (void)showAfterDelay:(NSTimeInterval)delay
              animated:(BOOL)animated {
    if (self.superview==nil) {
        [_showInView addSubview:self];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (animated) {
            [UIView animateWithDuration:0.25 animations:^{
                self.alpha = 1.0;
            }];
        }else{
            self.alpha = 1.0;
        }
        
    });
    
}

- (void)showAfterDelay:(NSTimeInterval)delay autoHideAfterDelay:(NSTimeInterval)showDuration animated:(BOOL)animated {
    [self showAfterDelay:delay animated:animated];
    [self hideAfterDelay:showDuration animated:animated];
}

- (void)hideAfterDelay:(NSTimeInterval)delay
              animated:(BOOL)animated {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (animated) {
            [UIView animateWithDuration:0.25 animations:^{
                self.alpha = 0.0;
            }];
        }else{
            self.alpha = 0.0;
        }
        
        [self removeFromSuperview];
    });
}

- (void)handleAnimationWithType:(DMProgressHUDAnimation)animationType {
    switch (animationType) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        
        default:
            break;
    }
}

#pragma mark -
#pragma mark -  Setter && Getter

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = [UIColor clearColor];
    }
    return _backgroundView;
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
    }
    return _containerView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 4;
    }
    return _contentView;
}

- (UIView *)accessory {
    if (!_accessory) {
        _accessory = [[UIView alloc] init];
        [_accessory addSubview:self.indicator];
    }
    return _accessory;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.text = _message;
        _messageLabel.font = [UIFont systemFontOfSize:16.0];
    }
    return _messageLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.text = _detailInfo;
        _detailLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _detailLabel;
}

- (UIActivityIndicatorView *)indicator {
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [_indicator startAnimating];
    }
    return _indicator;
}

- (void)setMessage:(NSString *)message {
    _messageLabel.text = message;
}

- (void)setDetailInfo:(NSString *)detailInfo {
    _detailLabel.text = detailInfo;
}

- (void)setSubviewsBackgroundColor {
    _backgroundView.backgroundColor = [UIColor yellowColor];
    _containerView.backgroundColor = [UIColor redColor];
    _contentView.backgroundColor = [UIColor whiteColor];
    _indicator.backgroundColor = [UIColor grayColor];
    _messageLabel.backgroundColor = [UIColor brownColor];
    _detailLabel.backgroundColor = [UIColor brownColor];
}

#pragma mark -
#pragma mark -  SetupSubviewsContrains

- (void)setupSubviewsContrains {
    [self addSubview:self.backgroundView];
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.contentView];
    [self.contentView addSubview:self.accessory];
    [self.contentView addSubview:self.messageLabel];
    [self.contentView addSubview:self.detailLabel];
    [_backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [_accessory mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(10);
        make.centerX.mas_equalTo(self.contentView);
        make.width.height.mas_equalTo(48);
    }];
    
    [_indicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_accessory);
    }];
    
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_accessory.mas_bottom);
        make.centerX.mas_equalTo(self.contentView);
        make.width.lessThanOrEqualTo(self.contentView).mas_offset(-20);
    }];
    
    float labelMarign = _messageLabel.text.length>0?5.0:0.0;
    
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(_messageLabel.mas_bottom).mas_offset(labelMarign);
        make.width.lessThanOrEqualTo(self.contentView).mas_offset(-20);
        make.bottom.lessThanOrEqualTo(self.contentView).mas_offset(-10);
    }];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.containerView);
        make.width.height.mas_equalTo(68).priorityLow();
        make.width.lessThanOrEqualTo(self.containerView).mas_offset(-20);
        make.height.lessThanOrEqualTo(self.containerView).mas_offset(-20);
    }];
    
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backgroundView);
        make.centerY.mas_equalTo(self.backgroundView).mas_offset(-50);
        make.height.width.mas_equalTo(88).priorityLow();
        make.width.lessThanOrEqualTo(self.backgroundView).mas_offset(-20);
        make.height.lessThanOrEqualTo(self.backgroundView).mas_offset(-20);
    }];
    
}

-(void)dealloc {
    NSLog(@"DMProgressHUD has been dealloc");
}

@end
