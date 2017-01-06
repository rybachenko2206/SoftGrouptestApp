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

+ (ResponseInfo *)responseInfoError:(NSError *)error urlSessionTask:(NSURLSessionTask *)task {
    ResponseInfo *response = [ResponseInfo new];
    response.success = NO;
    response.error = error;
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
    response.statusCode = httpResponse.statusCode;
    
    return response;
}

+ (ResponseInfo *)reponseWithObject:(id)object urlSessionTask:(NSURLSessionTask *)task {
    ResponseInfo *response = [ResponseInfo new];
    response.success = YES;
    response.object = object;
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
    response.statusCode = httpResponse.statusCode;
    return response;
}

@end
