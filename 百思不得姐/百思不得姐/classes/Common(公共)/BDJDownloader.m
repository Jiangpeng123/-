//
//  BDJDownloader.m
//  百思不得姐
//
//  Created by qianfeng on 16/11/22.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

#import "BDJDownloader.h"

@implementation BDJDownloader

+ (void)downloadWithURLString:(NSString *)urlString success:(void (^)(NSData *))finishBlock fail:(void (^)(NSError *))failBlock {
    //创建URL
    NSURL *url = [NSURL URLWithString:urlString];
    //创建Request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //创建NSURLSessionConfiguration
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    //设置返回的数据是原始的二进制数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //下载对象
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        //请求失败
        if (error) {
            failBlock(error);
        }else {
            //请求成功
            NSHTTPURLResponse *r = (NSHTTPURLResponse *)response;
            if (r.statusCode == 200)
            {   //返回正确数据
                finishBlock(responseObject);
            }else {
                //返回错误数据
                NSError *e = [NSError errorWithDomain:urlString code:r.statusCode userInfo:@{@"msg":@"下载失败"}];
                failBlock(e);
            }
            
        }

        
    }];
    
    [task resume];
   
    
}





@end













