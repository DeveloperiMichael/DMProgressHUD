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
    DMProgressHUD *_hud;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"Show HUD" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor brownColor];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 60));
        make.bottom.mas_equalTo(self.view).mas_offset(-100);
    }];
    
    UIButton *hideButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [hideButton setTitle:@"Show HUD" forState:UIControlStateNormal];
    [hideButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    hideButton.backgroundColor = [UIColor brownColor];
    [self.view addSubview:hideButton];
    
    [hideButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 60));
        make.bottom.mas_equalTo(self.view).mas_offset(-100);
    }];
    
   _hud = [[DMProgressHUD alloc] initWithShowInView:self.view];
    
}

- (void)buttonAction:(UIButton *)button {
    _hud.message = @"这是一个请求";
    _hud.detailInfo = @"已加载50%";
    [_hud showAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
