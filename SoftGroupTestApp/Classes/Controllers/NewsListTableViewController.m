//
//  NewsListTableViewController.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//


#import "NewsItem.h"
#import "NewsTableViewCell.h"
#import "SVProgressHUD.h"
#import "WebService.h"
#import "AlertManager.h"
#import "NewsDetailTableViewController.h"
#import "UIViewController+CustomMethods.h"

#import "NewsListTableViewController.h"

@interface NewsListTableViewController ()

@property (nonatomic, strong) NSArray *news;

@end

@implementation NewsListTableViewController

    
#pragma mark - Overriden methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self getNews];
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


#pragma mark —UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewsDetailTableViewController *newsDetailVc = [main instantiateViewControllerWithIdentifier:[NewsDetailTableViewController storyboardIndentifier]];
    newsDetailVc.newsItem = self.news[indexPath.row];
    [self.navigationController pushViewController:newsDetailVc animated:YES];
}


#pragma mark - Private methods

- (void)getNews {
    if (![WebService networkReachable]) {
        [AlertManager presentLostConnectionAlertToViewContorller:self];
        return;
    }
    [SVProgressHUD show];
    __weak typeof(self)weakSelf = self;
    [[WebService sharedInstance] getNewsWithCompletion:^(ResponseInfo *response) {
        [SVProgressHUD dismiss];
        if (response.error) {
            [AlertManager presentAlertError:response.error viewController:self];
        } else {
            weakSelf.news = [NewsItem newsFromResponse:response.object];
            [weakSelf.tableView reloadData];
        }
    }];
}


@end
