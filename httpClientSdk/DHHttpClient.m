//
//  DHHttpClient.m
//  DHHttpClient
//
//  Created by dahe on 2017/9/22.
//  Copyright © 2017年 dahe. All rights reserved.
//

#import "DHHttpClient.h"
#import "AFNetworking.h"


@implementation DHHttpClient{
    AFHTTPSessionManager *httpManager;
}
static DHHttpClient *client = nil;
- (id)init{
    self = [super init];
    if (self) {
        httpManager = [AFHTTPSessionManager manager];
        //设置返回文本格式
        httpManager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}
+ (DHHttpClient *)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [DHHttpClient new];
    });
    return client;
}
- (void)setHeader:(NSDictionary *)headers{
    //[httpManager.requestSerializer setValuesForKeysWithDictionary:headers];
    for (NSString *key in [headers allKeys]) {
        [httpManager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
    }
}
- (void)getURL:(NSString *)url success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))fail{
    [httpManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
- (void)postURL:(NSString *)url postData:(NSDictionary *)postData success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))fail{
    [httpManager POST:url parameters:postData progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
- (void)uploadImageWithURL:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data success:(void(^)(id responseObject))success fail:(void(^)(NSError *error))fail progress:(void (^)(NSProgress *progress))progress fileName:(NSString *)fileName{
    [httpManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"attach" fileName:fileName mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
@end
