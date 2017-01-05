//
//  WebService.h
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WebService : AFHTTPSessionManager

+ (WebService *)sharedInstance;
+ (BOOL)networkReachable;

@end
