//
//  NewsListTableViewController.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//


#import "NewsItem.h"
#import "NewsTableViewCell.h"

#import "NewsListTableViewController.h"

@interface NewsListTableViewController ()

@property (nonatomic, strong) NSArray *news;

@end

@implementation NewsListTableViewController

    
#pragma mark - Overriden methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - Delegate methods:
#pragma mark —UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellId = [NewsTableViewCell cellIdentifier];
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId
                                                              forIndexPath:indexPath];
    cell.item = self.news[indexPath.row];
    
    return cell;
}


@end
