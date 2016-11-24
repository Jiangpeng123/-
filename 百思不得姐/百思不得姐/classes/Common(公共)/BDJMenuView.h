//
//  BDJMenuView.h
//  百思不得姐
//
//  Created by qianfeng on 16/11/24.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM (NSInteger,MenuType) {
    MenuTypeEssence = 1 << 0,   //精华
    MenuTypeNews = 1 << 1       //最新
};
@class BDJMenuView;
@protocol BDJMenuViewDelegate <NSObject>

//点击了第几个按钮
- (void)menuView:(BDJMenuView *)menuView didCilckBtnAtIndex:(NSInteger)index;

//点击右边
- (void)menuView:(BDJMenuView *)menuView didClickRightBtn:(MenuType)
type;

@end
@interface BDJMenuView : UIView

//初始化方法
/*
 @param array:菜单数据的数组
 @param iconName:右边按钮上面的图片
 @param selectIconName:右边按钮高亮度图片*/
- (instancetype)initWithItems:(NSArray *)array rightIcon:(NSString *)iconName rightSelecctIcon:(NSString *)selectIconName;

//枚举类型
@property (nonatomic, assign)MenuType type;

//代理属性
@property (nonatomic, weak)id<BDJMenuViewDelegate> delegate;

//当前选择按钮的序号
@property (nonatomic, assign)NSInteger selectIndex;

@end

//菜单按钮
@class BDJSubMenu;
@interface BDJMenuButton : UIControl
//初始化方法
- (instancetype)initWithTitle:(NSString *)title;
//是否选中
@property (nonatomic, assign)BOOL clicked;

//按钮的序号
@property (nonatomic, assign)NSInteger btnIndex;


@end






