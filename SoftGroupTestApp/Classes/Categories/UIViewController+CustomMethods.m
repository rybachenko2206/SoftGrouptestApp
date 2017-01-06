//
//  UIViewController+CustomMethods.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/6/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import "UIViewController+CustomMethods.h"

@implementation UIViewController (CustomMethods)

+ (NSString *)storyboardIndentifier {
    return NSStringFromClass([self class]);
}

@end
