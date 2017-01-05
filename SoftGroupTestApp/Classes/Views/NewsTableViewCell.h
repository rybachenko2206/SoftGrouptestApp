//
//  NewsTableViewCell.h
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"

@interface NewsTableViewCell : UITableViewCell

@property (nonatomic, strong) NewsItem *item;

+ (NSString *)cellIdentifier;

@end
