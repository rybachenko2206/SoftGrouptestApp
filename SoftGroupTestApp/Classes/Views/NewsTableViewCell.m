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
    
    // TODO: write set item
}


#pragma mark - Static methods

+ (NSString *)cellIdentifier {
    return NSStringFromClass(self);
}

@end
