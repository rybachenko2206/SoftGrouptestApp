//
//  NewsDetailTableViewController.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "NewsItem.h"

#import "NewsDetailTableViewController.h"


@interface NewsDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dislikeLabel;
@property (weak, nonatomic) IBOutlet UILabel *articleLabel;
@property (weak, nonatomic) IBOutlet UILabel *hashtagsLabel;




@end


@implementation NewsDetailTableViewController

#pragma mark - Overriden methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.newsItem.newsTitle;
    [self showNewsItem];
    
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}


#pragma mark - Action methods

- (IBAction)likeButtonTapped:(id)sender {
}

- (IBAction)dislikeButtonTapped:(id)sender {
}


#pragma mark - Delegate methods:
#pragma mark —UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


#pragma mark - Private methods 

- (void)showNewsItem {
    NSURL *imgUrl = [NSURL URLWithString:self.newsItem.image];
    UIImage *placeholder = [UIImage imageNamed:@"placeholder"];
    [self.photoImageView sd_setImageWithURL:imgUrl placeholderImage:placeholder];
    self.hashtagsLabel.text = [self.newsItem hashtagsString];
    self.likeLabel.text = [self.newsItem.like stringValue];
    self.dislikeLabel.text = [self.newsItem.dislike stringValue];
    self.phoneLabel.text = self.newsItem.phone;
    self.articleLabel.text = self.newsItem.article;
}

@end
