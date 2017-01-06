//
//  WebService.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import <AFNetworking/AFNetworkActivityIndicatorManager.h>
#import "NetworkStatusManager.h"
#import "AppDelegate.h"
#import "ResponseInfo.h"

#import "WebService.h"

@implementation WebService

+ (WebService *)sharedInstance {
    static WebService *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WebService alloc] init];//WithBaseURL:[NSURL URLWithString:BaseURL]];
    });
    return _sharedInstance;
}


#pragma mark - Static methods

+ (BOOL)networkReachable {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    NSLog(@"reachability status = %@", [appDelegate.networkManager currentReachabilityString]);
    return [appDelegate.networkManager isReachable];
}


#pragma mark - Interface methods

- (void)getNewsWithCompletion:(RequestCallback)completion {
    NSURL *URL = [NSURL URLWithString:BaseURL];
    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             
             [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
             ResponseInfo *response = [ResponseInfo reponseWithObject:responseObject  urlSessionTask:task];
             NSLog(@"\n~~Get news response: %@", responseObject);
             completion(response);
             
    } failure:^(NSURLSessionTask *sessionTask, NSError *error) {
        
        [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
        ResponseInfo *response = [ResponseInfo responseInfoError:error urlSessionTask:sessionTask];
        completion(response);
        NSLog(@"\n~~GetNews Error: %@", error.localizedDescription);
        
    }];
}

@end
