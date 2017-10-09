//
//  DHHttpClient.h
//  DHHttpClient
//
//  Created by dahe on 2017/9/22.
//  Copyright © 2017年 dahe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHHttpClient : NSObject

+ (DHHttpClient *)shareInstance;
//默认不设置任何header，调用此方法后全局生效
- (void)setHeader:(NSDictionary *)headers;
- (void)getURL:(NSString *)url success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))fail;
- (void)postURL:(NSString *)url postData:(NSDictionary *)postData success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))fail;
- (void)uploadImageWithURL:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))fail progress:(void (^)(NSProgress *progress))progress fileName:(NSString *)fileName;
@end
