//
//  ResponseInfo.m
//  ExecConnect
//
//  Created by Roman Rybachenko on 12/2/15.
//  Copyright © 2015 Roman Rybachenko. All rights reserved.
//


#import "AFNetworking.h"

#import "ResponseInfo.h"

@implementation ResponseInfo

+ (ResponseInfo *)responseInfoError:(NSError *)error urlSessionTask:(NSURLSessionDataTask *)task {
    ResponseInfo *response = [[ResponseInfo alloc] init];
    response.success = NO;
    response.error = error;
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
    response.statusCode = httpResponse.statusCode;
    
    return response;
}

@end
