//
//  BDJDownloader.h
//  百思不得姐
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
//将闭包定义成一个类型
typedef void(^SUCCESSBLOCK)(NSData *data);
typedef void(^FAILBLOCK)(NSError *error);


@interface BDJDownloader : NSObject
//+ (void)downloadWithURLString:(NSString *)urlString success:(SUCCESSBLOCK)finishBlock fail:(FAILBLOCK)failBlock;


//参数名可以省略,下面这样写也是对的
//+ (void)downloadWithURLString:(NSString *)urlString success:(void(^)(NSData *))finishBlock fail:(void(^)(NSError *))failBlock;

+ (void)downloadWithURLString:(NSString *)urlString success:(void(^)(NSData *data))finishBlock fail:(void(^)(NSError *error))failBlock;

@end
