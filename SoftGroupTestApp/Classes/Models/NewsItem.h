//
//  NewsItem.h
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Like) {
    LikeNotSpecified = 0,
    LikeYes,
    LikeNo
};

@interface NewsItem : NSObject

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *article;
@property (nonatomic, strong) NSString *newsTitle;
@property (nonatomic, strong) NSArray *hashtags;
@property (nonatomic, strong) NSNumber *like;
@property (nonatomic, strong) NSNumber *dislike;

@property (nonatomic, assign) Like userLike;



+ (NSArray *)newsFromResponse:(id)response;
- (UIImage *)categoryIcon;
- (NSString *)hashtagsString;


@end
