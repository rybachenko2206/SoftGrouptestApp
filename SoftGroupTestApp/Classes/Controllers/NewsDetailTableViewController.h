//
//  NewsDetailTableViewController.h
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsItem;

@interface NewsDetailTableViewController : UITableViewController

@property (nonatomic, strong) NewsItem *newsItem;


@end
