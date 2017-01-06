//
//  NewsTableViewCell.m
//  SoftGroupTestApp
//
//  Created by Roman Rybachenko on 1/5/17.
//  Copyright © 2017 Roman Rybachenko. All rights reserved.
//


#import "NewsTableViewCell.h"


@interface NewsTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *hashtagsLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@end


@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


#pragma mark - Setters

- (void)setItem:(NewsItem *)item {
    _item = item;
    
    self.avatarImageView.image = [_item categoryIcon];
    self.newsTitleLabel.text = _item.newsTitle;
    self.newsTextLabel.text = _item.article;
    [self setAuthor:_item.author];
    self.hashtagsLabel.text = [_item hashtagsString];
}


#pragma mark - Static methods

+ (NSString *)cellIdentifier {
    return NSStringFromClass(self);
}


#pragma mark - Private methods

- (void)setAuthor:(NSString *)author {
    NSString *title = @"Author: ";
    NSString *fullString = [title stringByAppendingString:author];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:fullString];
    NSRange titleRange = NSMakeRange(0, title.length);
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:self.authorLabel.font.pointSize];
    [attrString addAttribute:NSFontAttributeName value:font range:titleRange];
    
    self.authorLabel.attributedText = attrString;
}


@end
