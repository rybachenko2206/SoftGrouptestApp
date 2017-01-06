//
//  ResponseInfo.h
//  ExecConnect
//
//  Created by Roman Rybachenko on 12/2/15.
//  Copyright © 2015 Roman Rybachenko. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ResponseInfo : NSObject

@property (nonatomic, assign) BOOL success;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, strong) id object;
@property (nonatomic, assign) NSInteger statusCode;


+ (ResponseInfo *)responseInfoError:(NSError *)error urlSessionTask:(NSURLSessionTask *)task;
+ (ResponseInfo *)reponseWithObject:(id)object urlSessionTask:(NSURLSessionTask *)task;

@end
