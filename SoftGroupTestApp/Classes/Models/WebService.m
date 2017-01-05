//
//  WebService.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import "AFNetworkActivityIndicatorManager.h"
#import "NetworkStatusManager.h"

#import "WebService.h"

@implementation WebService

+ (WebService *)sharedInstance {
    static WebService *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WebService alloc] initWithBaseURL:[NSURL URLWithString:BaseURL]];
        
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    });
    return _sharedInstance;
}

+ (NSString *)mimeTypeWithExtention:(NSString *)extension {
    NSString *UTI = (__bridge_transfer NSString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)extension, NULL);
    NSString *contentType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass((__bridge CFStringRef)UTI, kUTTagClassMIMEType);
    
    if (!contentType) {
        return @"application/octet-stream";
    } else {
        return contentType;
    }
}


#pragma mark - Instance initialization

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", @"POST", nil];
    [self.requestSerializer setValue:@"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    [self.requestSerializer setValue:@"gzip, deflate, sdch" forHTTPHeaderField:@"Accept-Encoding"];
    
    AFJSONResponseSerializer *JSONResponseSerialize = [AFJSONResponseSerializer serializer];
    JSONResponseSerialize.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/plain", nil];
    
    self.responseSerializer = [AFCompoundResponseSerializer compoundSerializerWithResponseSerializers:@[JSONResponseSerialize, [AFHTTPRequestSerializer serializer]]];
    
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.validatesDomainName = NO;
    securityPolicy.allowInvalidCertificates = YES;
    
    self.securityPolicy = securityPolicy;
    return self;
}

@end
