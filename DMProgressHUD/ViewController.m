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
    
    self.view.backgroundColor = [UIColor brownColor];
    _hud = [[DMProgressHUD alloc] initWithShowInView:self.view];
    [_hud showAfterDelay:0.0 animated:YES];
    
//    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
//    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.label.text = @"正";
//    hud.detailsLabel.text = @"MB";
//    [hud showAnimated:YES];
//    [self.view addSubview:hud];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
