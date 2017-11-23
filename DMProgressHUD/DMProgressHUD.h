//
//  DMProgressHUD.h
//  DMProgressHUD
//
//  Created by 张炯 on 2017/7/26.
//  Copyright © 2017年 张炯. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 HUD类型

 - mode1: mode1 description
 - mode2: mode2 description
 - mode2: mode2 description
 */
typedef NS_ENUM(NSInteger, DMProgressHUDMode) {
    mode1 = 0,
    mode2,
    mode3,
};



/**
 HUD展示、消失动画

 - Animation1: Animation1 description
 - Animation2: Animation2 description
 - Animation3: Animation3 description
 */
typedef NS_ENUM(NSInteger, DMProgressHUDAnimation) {
    DMProgressHUDAnimationScale = 0,
    Animation2,
    Animation3,
};


@interface DMProgressHUD : UIView


/**
 自定义DMProgressHUD上面的view,UIActivityIndicatorView的位置
 */
@property (nonatomic, strong) UIView *indicatorView;

/**
 自定义DMProgressHUD上面的view,contentView的位置
 */
@property (nonatomic, strong) UIView *customView;


/**
 HUD类型
 */
@property (nonatomic, assign) DMProgressHUDMode hudMode;


/**
 动画类型
 */
@property (nonatomic, assign) DMProgressHUDAnimation animationType;


/**
 提示信息
 */
@property (nonatomic, copy) NSString *message;


/**
 详细信息
 */
@property (nonatomic, copy) NSString *detailInfo;

/**
 显示时间
 */
@property (nonatomic, assign) CGFloat showDuration;

#pragma mark -
#pragma mark -  show

- (instancetype)initWithShowInView:(UIView *)inView;

/**
 开始加载动画
 */


- (void)showAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

- (void)showAnimated:(BOOL)animated;

#pragma mark -
#pragma mark -  hide

/**
 停止加载动画
 */

- (void)hideAnimated:(BOOL)animated;

@end
