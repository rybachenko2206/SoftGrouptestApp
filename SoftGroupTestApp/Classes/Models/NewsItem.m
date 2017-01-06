//
//  NewsItem.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//



#import "NewsItem.h"


static NSString * const kAuthor = @"author";
static NSString * const kTitle = @"title";
static NSString * const kCategory = @"category";
static NSString * const kDescription = @"description";
static NSString * const kDislike = @"dislike";
static NSString * const kLike = @"like";
static NSString * const kImage = @"image";
static NSString * const kPhone = @"phone";
static NSString * const kTags = @"tags";

@implementation NewsItem

#pragma mark - Static methods


#pragma mark - Interface methods

- (UIImage *)categoryIcon {
    UIImage *icon = [UIImage imageNamed:self.category];
    if (!icon) {
        icon = [UIImage imageNamed:@"emptyAvatar"];
    }
    return icon;
}

- (NSString *)hashtagsString {
    NSString *hashtagsStr = @"";
    for (NSString *tag in self.hashtags) {
        NSString *currTag = [NSString stringWithFormat:@"#%@", tag];
        hashtagsStr = [hashtagsStr stringByAppendingString:currTag];
    }
    return hashtagsStr;
}

//- (void)setHashtags:(NSArray *)hashtags {
//    NSString *hashtagsStr = @"";
//    for (NSString *tag in hashtags) {
//        NSString *currTag = [NSString stringWithFormat:@"#%@", tag];
//        hashtagsStr = [hashtagsStr stringByAppendingString:currTag];
//    }
//    
//    self.hashtagsLabel.text = hashtagsStr;
//}

+ (NSArray *)newsFromResponse:(id)response {
    NSArray *news = [NSArray array];
    if (!response || ![response isKindOfClass:[NSArray class]]) {
        return news;
    }
    
    for (NSDictionary *item in response) {
        NewsItem *ni = [[NewsItem alloc] init];
        ni.author = item[kAuthor];
        ni.category = item[kCategory];
        ni.article = item[kDescription];
        ni.newsTitle = item[kTitle];
        ni.dislike = item[kDislike];
        ni.like = item[kLike];
        ni.phone = item[kPhone];
        ni.image = item[kImage];
        ni.hashtags = item[kTags];
        news = [news arrayByAddingObject:ni];
    }
    
    return news;
}

@end
