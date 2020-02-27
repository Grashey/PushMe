//
//  PlaceTableViewCell.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 24.02.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "PlaceTableViewCell.h"

@implementation PlaceTableViewCell

double cellHeight = 44.0;
double rightLabelWidth = 90.0;

- (void)prepareForReuse{
    [super prepareForReuse];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, [UIScreen mainScreen].bounds.size.width - rightLabelWidth, cellHeight)];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
        _leftLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
        [self.contentView addSubview:_leftLabel];
        
        _rightLabel = [[UILabel alloc] initWithFrame: CGRectMake([UIScreen mainScreen].bounds.size.width - rightLabelWidth, 0.0, rightLabelWidth, cellHeight)];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
        [self.contentView addSubview:_rightLabel];
    }
    return self;
}

- (void) configureWithCity:(City *)city {
    _leftLabel.text = city.name;
    _rightLabel.text = city.code;
}

- (void) configureWithAirport:(Airport *)airport {
    _leftLabel.text = airport.name;
    _rightLabel.text = airport.code;
}

@end
