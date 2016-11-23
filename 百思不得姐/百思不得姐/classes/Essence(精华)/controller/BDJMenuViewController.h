//
//  BDJMenuViewController.h
//  百思不得姐
//
//  Created by qianfeng on 16/11/23.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

#import "BaseViewController.h"

@interface BDJMenuViewController : BaseViewController

//标题列表的数据
@property (nonatomic, strong)NSArray *subMenus;
//右边按钮的图片
@property (nonatomic, copy)NSString *rightImageName;
//右边按钮的高亮状态
@property (nonatomic, copy)NSString *rightHLImageName;

@property (nonatomic, strong)void (^rightBtnBlock)(void);

@end
