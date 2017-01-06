//
//  WebService.h
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WebService : NSObject//AFHTTPSessionManager

+ (WebService *)sharedInstance;
+ (BOOL)networkReachable;

- (void)getNewsWithCompletion:(RequestCallback)completion;

@end
