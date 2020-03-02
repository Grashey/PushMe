//
//  NewsViewCell.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 02.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "NewsViewCell.h"
#import <YYWebImage/YYWebImage.h>

@interface NewsViewCell ()
@property (nonatomic, strong) UIImageView *newsImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@end

@implementation NewsViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.contentView.layer.shadowColor = [[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor];
        self.contentView.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        self.contentView.layer.shadowRadius = 10.0;
        self.contentView.layer.shadowOpacity = 1.0;
        self.contentView.layer.cornerRadius = 6.0;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightBold];
        [self.contentView addSubview:_titleLabel];
        
        _newsImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _newsImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_newsImageView];
        
        _descriptionLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _descriptionLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightLight];
        _descriptionLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_descriptionLabel];
        
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _dateLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular];
        [self.contentView addSubview:_dateLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(10.0, 10.0, [UIScreen mainScreen].bounds.size.width - 20.0, self.frame.size.height - 20.0);
    _newsImageView.frame = CGRectMake(10.0, 10.0, 100.0, 100.0);
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_newsImageView.frame) + 10.0, 10.0, self.contentView.frame.size.width - 130.0, 40.0);
    _descriptionLabel.frame = CGRectMake(CGRectGetMaxX(_newsImageView.frame) + 10.0, CGRectGetMaxY(_titleLabel.frame) + 16.0, 100.0, 20.0);
    _dateLabel.frame = CGRectMake(CGRectGetMaxX(_newsImageView.frame) + 10.0, CGRectGetMaxY(_descriptionLabel.frame) + 8.0, self.contentView.frame.size.width - 20.0, 20.0);
}

- (void)setNews:(News *)news {
    _news = news;
    
    _titleLabel.text = [NSString stringWithFormat:@"%@", news.title];
    _descriptionLabel.text = [NSString stringWithFormat:@"%@", news.descript];
    _dateLabel.text = [NSString stringWithFormat:@"%@", news.publishedAt];
    NSURL *urlLogo = [NSURL URLWithString:[NSString stringWithFormat:@"%@", news.urlToImage]];
    [_newsImageView yy_setImageWithURL: urlLogo options: YYWebImageOptionSetImageWithFadeAnimation];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

