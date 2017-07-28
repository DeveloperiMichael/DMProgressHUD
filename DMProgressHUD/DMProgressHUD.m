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


@end

@implementation DMProgressHUD

- (instancetype)initWithShowInView:(UIView *)inView {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, inView.bounds.size.width, inView.bounds.size.height);
        [self setupData];
        NSAssert(inView, @"inView must not be nil");
        [inView addSubview:self];
        [self setupSubviewsContrains];
        self.alpha = 0.0;
    }
    return self;
}

#pragma mark -
#pragma mark -  Private Methods

- (void)setupData {
    self.hudMode = 0;
    self.animationType = 0;
    self.message = @"正在加载";
    self.showDuration = 2.5;
}


- (void)showAfterDelay:(NSTimeInterval)delay
              animated:(BOOL)animated {
    
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
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor yellowColor];
    }
    return _contentView;
}

- (UIView *)accessory {
    if (!_accessory) {
        _accessory = [[UIView alloc] init];
        _accessory.backgroundColor = [UIColor purpleColor];
    }
    return _accessory;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.text = @"NSTextAlignmentCenter";
        _messageLabel.backgroundColor = [UIColor brownColor];
        _messageLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    }
    return _messageLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.text = @"_messageLabel.backgroundColor = [UIColor brownColor];";
        _detailLabel.backgroundColor = [UIColor brownColor];
        _detailLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _detailLabel;
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
        make.top.mas_equalTo(self.contentView).mas_offset(5);
        make.centerX.mas_equalTo(self.contentView);
        make.width.height.mas_equalTo(90);
    }];
    
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_accessory.mas_bottom);
        make.centerX.mas_equalTo(self.contentView);
        make.width.lessThanOrEqualTo(self.contentView).mas_offset(-10);
    }];
    
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(_messageLabel.mas_bottom);
        make.width.lessThanOrEqualTo(self.contentView).mas_offset(-10);
        make.bottom.lessThanOrEqualTo(self.contentView).mas_offset(-5);
    }];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.containerView);
        make.width.height.mas_equalTo(100).priorityLow();
        make.width.lessThanOrEqualTo(self.containerView).mas_offset(-20);
        make.height.lessThanOrEqualTo(self.containerView).mas_offset(-20);
    }];
    
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backgroundView);
        make.centerY.mas_equalTo(self.backgroundView).mas_offset(-50);
        make.height.width.mas_equalTo(120).priorityLow();
        make.width.lessThanOrEqualTo(self.backgroundView).mas_offset(-20);
        make.height.lessThanOrEqualTo(self.backgroundView).mas_offset(-20);
    }];
    
}

-(void)dealloc {
    NSLog(@"DMProgressHUD has been dealloc");
}

@end
